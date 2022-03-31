import 'package:appvehicles/constants/const_colors.dart';
import 'package:appvehicles/core/enum/application_loading.dart';
import 'package:appvehicles/core/helpers/application_helpers.dart';
import 'package:appvehicles/core/helpers/application_navigator.dart';
import 'package:appvehicles/core/responsive/responsive_builder.dart';
import 'package:appvehicles/core/responsive/sizing_information.dart';
import 'package:appvehicles/core/scaffold/app_bar_default.dart';
import 'package:appvehicles/core/scaffold/app_scaffold.dart';
import 'package:appvehicles/core/widgets/application_button.dart';
import 'package:appvehicles/modules/home/infra/models/vehicle_impl.dart';
import 'package:appvehicles/modules/home/presenter/controller/vehicle_controller.dart';
import 'package:appvehicles/modules/home/presenter/pages/vehicle_details.dart';
import 'package:appvehicles/modules/home/presenter/widgets/card_image_vehicle.dart';
import 'package:appvehicles/modules/home/presenter/widgets/card_tags.dart';
import 'package:appvehicles/modules/home/presenter/widgets/card_title.dart';
import 'package:appvehicles/modules/home/presenter/widgets/shimmer_vehicle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehiclePhone extends StatefulWidget {
  const VehiclePhone({Key? key}) : super(key: key);

  @override
  _VehiclePhoneState createState() => _VehiclePhoneState();
}

class _VehiclePhoneState extends State<VehiclePhone> with WidgetsBindingObserver {
  final _controller = Get.find<VehicleController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _controller.getFirstPage(true);
      _scrollController.addListener(() {
        _controller.onScroll(_scrollController.position.pixels, _scrollController.position.maxScrollExtent);
      });
    });
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: ConstColors.background,
      body: SafeArea(
        child: AppScaffold(
          backgroundColor: ConstColors.background,
          onWillPop: () async => await Future.value(true),
          appBar: AppBarDefault.bar(
            showIconBackTop: false,
            elevation: 0.5,
            toolbarHeight: 55,
            title: Text(
              'pageVehicle'.tr.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          body: ResponsiveBuilder(builder: (context, view) {
            return CupertinoScrollbar(
              isAlwaysShown: false,
              controller: _scrollController,
              child: RefreshIndicator(
                onRefresh: () async => await _controller.swipeRefresh(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(() {
                              if ((_controller.isLoading.value == ApplicationLoading.notLoading) || (_controller.isLoading.value == ApplicationLoading.nextPageLoading)) {
                                if (_controller.listVehicles.isEmpty) return _notHashData(view);
                                return ListItemVehicle(_controller.listVehicles);
                              } else {
                                if (_controller.isLoading.value == ApplicationLoading.shimmerLoading) {
                                  return const ShimmerVehicle();
                                } else {
                                  return const Center(child: CupertinoActivityIndicator());
                                }
                              }
                            }),
                            Obx(() {
                              return Visibility(
                                visible: _controller.isLoading.value == ApplicationLoading.nextPageLoading,
                                child: const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: CupertinoActivityIndicator(),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _notHashData(SizingInformation view) {
    return Container(
      height: view.localWidgetSize?.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('notHashData'.tr, style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.center),
          ApplicationButton(
            onPressed: () async => await _controller.getFirstPage(),
            child: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ListItemVehicle extends StatelessWidget {
  final List<VehicleImpl> list;

  const ListItemVehicle(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final VehicleImpl _model = list[index];

        String? _price = Helpers.formatPrice(_model.price);

        /// TODO http://desafioonline.webmotors.com.br/content/img/05.jpg
        /// Servidor não aceita a requisição para leitura http somente para https
        String? _image = Helpers.formatURLImage(_model.image);

        return InkWell(
          onTap: () => ApplicationNavigator.open(context, VehicleDetails(data:_model)),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                CardImageVehicle(image: _image),
                CardTitle(
                  make: _model.make,
                  textSpan: [
                    TextSpan(text: " ${_model.model?.toString()}"),
                    TextSpan(text: " ${_price.toString()}"),
                  ],
                  version: _model.version,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CardTags(title: "${_model.yearFab}/${_model.yearModel}"),
                      const SizedBox(width: 10),
                      CardTags(title: "KM ${_model.km}"),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    ApplicationButton(
                      child: Text('buttonMore'.tr),
                      backgroundColor: ConstColors.danger,
                      onPressed: () => ApplicationNavigator.open(context, VehicleDetails(data:_model)),
                      width: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: list.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, index) => const SizedBox(height: 10),
    );
  }
}
