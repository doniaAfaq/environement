 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app/current_location_controller.dart';
import '../../../../data/controller/epicenter/add_epicenter_controller.dart';
import '../../../../data/controller/epicenter/add_map_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

// ignore: must_be_immutable
class EpiCenterMapScreen extends StatelessWidget {
  EpiCenterMapScreen({Key? key}) : super(key: key);

  CurrentLocationController currentLocation =
      Get.put(CurrentLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<AddEpicenterMapCtrl>(
              init: AddEpicenterMapCtrl(),
              builder: (mapCtrl) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(currentLocation.currentLat,
                            currentLocation.currentLong),
                        zoom: 14.4746,
                      ),
                      mapType: MapType.satellite,
                      onTap: (location) {
                        mapCtrl.setMarker(location);
                        mapCtrl.clicked();
                      },
                      markers: mapCtrl.mark.markerId == const MarkerId("0")
                          ? {}
                          : {mapCtrl.mark},
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        mapCtrl.compeleteController.complete(controller);
                      },
                    ),
                    if (mapCtrl.isClicked == true)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GetBuilder<AddEpicenterController>(
                            init: AddEpicenterController(),
                            builder: (epicenterCtrl) {
                              return InkWell(
                                onTap: () {
                                  epicenterCtrl.setEpicenterLocation(
                                      mapCtrl.mark.position.latitude,
                                      mapCtrl.mark.position.longitude);
                                  Get.back();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: SizeConfig.screenWidth! / MediaSize.m2,
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m12,
                                  margin: const EdgeInsets.only(
                                      bottom: AppMargin.m14),
                                  decoration: BoxDecoration(
                                      color: ColorManager.secondary,
                                      borderRadius: BorderRadius.circular(
                                          BorderRadiusValues.br8)),
                                  child: Text(
                                    "Add location".tr,
                                    style: getSemiBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s16),
                                  ),
                                ),
                              );
                            }),
                      )
                  ],
                );
              })),
    );
  }
}
