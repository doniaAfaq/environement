import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/model/epicenter/epicenter_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/size_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/resources/styles_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../network/nearst_epicenter_service.dart';

enum NearstEpicenterRadio { all, notVisited, visited }

class NearstEpicenterController extends GetxController {
  final double lat;
  final double long;
  RxBool loading = true.obs;
  List<EpicenterModel> nearstEpicenter = [];
  NearstEpicenterRadio charcter = NearstEpicenterRadio.all;
  Set<Marker> markers = {};
  Completer<GoogleMapController> compeleteController = Completer();

  void onRadioChange(NearstEpicenterRadio value) {
    if (value == NearstEpicenterRadio.notVisited) {
      charcter = value;
      update();
      getNearstEpicenter(0, lat, long);
    }
    if (value == NearstEpicenterRadio.visited) {
      charcter = value;
      update();
      getNearstEpicenter(1, lat, long);
    }
    if (value == NearstEpicenterRadio.all) {
      charcter = value;
      update();
      getNearstEpicenter(2, lat, long);
    }
  }

  NearstEpicenterController(this.lat, this.long);
  @override
  void onInit() {
    getNearstEpicenter(2, lat, long);
    super.onInit();
  }

  Future<void> openMap(double lat, double long) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    if (await canLaunchUrl(Uri.parse(googleMapUrl))) {
      await launchUrl(Uri.parse(googleMapUrl));
    } else {
      throw 'could not open map';
    }
  }

  void setMarker(List<EpicenterModel> allEpicenter, int newStatus) {
    markers.clear();
    for (var i = 0; i < allEpicenter.length; i++) {
      if (newStatus == 0) {
        markers.add(Marker(
            markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
            position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
            icon: BitmapDescriptor.defaultMarker,
            onTap: () {
              Get.defaultDialog(
                title: "HotSpot Details".tr,
                content: Text(
                  [
                    "${"Creation Date ".tr} : ${DateTime.parse(allEpicenter[i].creationDate)}",
                    "\n",
                    "${"Description ".tr} : ${allEpicenter[i].description}",
                    "\n",
                    "${"Reason ".tr} : ${allEpicenter[i].reason}",
                    "\n",
                    "${"Size ".tr} : ${allEpicenter[i].size} meter",
                    "\n",
                    "${"Status ".tr} : ${allEpicenter[i].status == 0 ? 'probability'.tr : allEpicenter[i].status == 1 ? 'confirmed'.tr : allEpicenter[i].status == 2 ? 'rejected'.tr : 'delayed'.tr}",
                    "\n"
                  ].join(""),
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(color: ColorManager.secondary),
                ),
                confirm: InkWell(
                  onTap: () {
                    openMap(allEpicenter[i].lat, allEpicenter[i].long);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth! / MediaSize.m3,
                    height: SizeConfig.screenHeight! / MediaSize.m20,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br8)),
                    child: Text(
                      "go to HotSpot".tr,
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              );
            }));
      } else if (newStatus == 1) {
        markers.add(Marker(
            markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
            position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            onTap: () {
              Get.defaultDialog(
                title: "HotSpot Details".tr,
                content: Text(
                  [
                    "${"Creation Date ".tr} : ${DateTime.parse(allEpicenter[i].creationDate)}",
                    "\n",
                    "${"Description ".tr} : ${allEpicenter[i].description}",
                    "\n",
                    "${"Reason ".tr} : ${allEpicenter[i].reason}",
                    "\n",
                    "${"Size ".tr} : ${allEpicenter[i].size} meter",
                    "\n",
                    "${"Status ".tr} : ${allEpicenter[i].status == 0 ? 'probability'.tr : allEpicenter[i].status == 1 ? 'confirmed'.tr : allEpicenter[i].status == 2 ? 'rejected'.tr : 'delayed'.tr}",
                    "\n"
                  ].join(""),
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(color: ColorManager.secondary),
                ),
                confirm: InkWell(
                  onTap: () {
                    openMap(allEpicenter[i].lat, allEpicenter[i].long);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth! / MediaSize.m3,
                    height: SizeConfig.screenHeight! / MediaSize.m20,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br8)),
                    child: Text(
                      "go to HotSpot".tr,
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              );
            }));
      } else {
        markers.add(Marker(
            markerId: MarkerId("${allEpicenter[i].lat}${allEpicenter[i].long}"),
            position: LatLng(allEpicenter[i].lat, allEpicenter[i].long),
            icon: allEpicenter[i].reportId == 0
                ? BitmapDescriptor.defaultMarker
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
            onTap: () {
              Get.defaultDialog(
                title: "HotSpot Details".tr,
                content: Text(
                  [
                    "${"Creation Date ".tr} : ${DateTime.parse(allEpicenter[i].creationDate)}",
                    "\n",
                    "${"Description ".tr} : ${allEpicenter[i].description}",
                    "\n",
                    "${"Reason ".tr} : ${allEpicenter[i].reason}",
                    "\n",
                    "${"Size ".tr} : ${allEpicenter[i].size} meter",
                    "\n",
                    "${"Status ".tr} : ${allEpicenter[i].status == 0 ? 'probability'.tr : allEpicenter[i].status == 1 ? 'confirmed'.tr : allEpicenter[i].status == 2 ? 'rejected'.tr : 'delayed'.tr}",
                    "\n"
                  ].join(""),
                  overflow: TextOverflow.ellipsis,
                  style: getSemiBoldStyle(color: ColorManager.secondary),
                ),
                confirm: InkWell(
                  onTap: () {
                    openMap(allEpicenter[i].lat, allEpicenter[i].long);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth! / MediaSize.m3,
                    height: SizeConfig.screenHeight! / MediaSize.m20,
                    decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusValues.br8)),
                    child: Text(
                      "go to HotSpot".tr,
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              );
            }));
      }

      update();
    }
  }

  void getNearstEpicenter(int status, double lat, double long) {
    loading.value = true;
    NearstEpicenterServices.getNearstEpicenter(status, lat, long).then((res) {
      //! success
      if (res.runtimeType == List<EpicenterModel>) {
        loading.value = false;
        update();
        nearstEpicenter = res;
        setMarker(res, status);
      } else if (res == 500) {
        //!Server Error
        loading.value = false;
        update();
        Get.defaultDialog(
          title: AppStrings.serverErrorTitle,
          middleText: AppStrings.serverError,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      } else if (res == 400) {
        loading.value = false;
        update();
        Get.defaultDialog(
          title: AppStrings.error,
          middleText: AppStrings.errorMsg,
          onConfirm: () => Get.back(),
          confirmTextColor: ColorManager.white,
          buttonColor: ColorManager.error,
          backgroundColor: ColorManager.white,
        );
      }
    });
  }
}
