import 'package:appvehicles/constants/const_colors.dart';
import 'package:appvehicles/core/helpers/application_helpers.dart';
import 'package:appvehicles/core/responsive/responsive_builder.dart';
import 'package:appvehicles/core/scaffold/app_bar_default.dart';
import 'package:appvehicles/core/scaffold/app_scaffold.dart';
import 'package:appvehicles/core/widgets/application_button.dart';
import 'package:appvehicles/modules/home/infra/models/vehicle_impl.dart';
import 'package:appvehicles/modules/home/presenter/widgets/card_image_vehicle.dart';
import 'package:appvehicles/modules/home/presenter/widgets/card_tags.dart';
import 'package:appvehicles/modules/home/presenter/widgets/card_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class VehicleDetails extends StatelessWidget {
  final VehicleImpl data;
  const VehicleDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: ConstColors.background,
      body: SafeArea(
        child: AppScaffold(
          backgroundColor: ConstColors.background,
          onWillPop: () async => await Future.value(true),
          appBar: AppBarDefault.bar(
            elevation: 0.5,
            toolbarHeight: 55,
            title: Text(
              'pageVehicleDetails'.tr.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          body: ResponsiveBuilder(builder: (context, view) {
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  CardImageVehicle(image: Helpers.formatURLImage(data.image)),
                  CardTitle(
                    make: data.make,
                    textSpan: [
                      TextSpan(text: " ${data.model?.toString()}"),
                      TextSpan(text: " ${Helpers.formatPrice(data.price)}"),
                    ],
                    version: data.version,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CardTags(title: "Ano ${data.yearFab}/${data.yearModel}"),
                        const SizedBox(width: 10),
                        CardTags(title: "KM ${data.km}"),
                        const SizedBox(width: 10),
                        CardTags(title: "Cor ${data.color}"),
                      ],
                    ),
                  ),
                  ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    ApplicationButton(
                      child: Text('back'.tr),
                      backgroundColor: ConstColors.danger,
                      onPressed: () => Navigator.pop(context),
                      width: 150,
                    ),
                  ],
                ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
