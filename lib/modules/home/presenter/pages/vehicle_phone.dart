
import 'package:appvehicles/constants/const_colors.dart';
import 'package:appvehicles/core/responsive/responsive_builder.dart';
import 'package:appvehicles/core/scaffold/app_bar_default.dart';
import 'package:appvehicles/core/scaffold/app_scaffold.dart';
import 'package:appvehicles/modules/home/presenter/controller/vehicle_controller.dart';
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
  // final _debouncer = Debouncer(delay: Duration(milliseconds: 500));

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
      // bottomNavigationBar: AppBottomNavigationBar(disableVehicle: true),
      body: SafeArea(
        child: AppScaffold(
          backgroundColor: ConstColors.background,
          onWillPop: () async => await Future.value(true),
          appBar: AppBarDefault.bar(
            onPressedLeading: () {},
            title: Text(
              'home'.tr.toUpperCase(),
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
                            Text('xxxxxxxx======>>>xxxxx'),
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
}
