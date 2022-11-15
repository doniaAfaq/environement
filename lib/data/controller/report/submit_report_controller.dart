import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/constants.dart';
import '../../../app/current_location_controller.dart';
import '../../../domain/model/report/add_report_model.dart';
import '../../../presentation/Home/home_screen.dart';
import '../../../presentation/login/login_screen.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/add_report_service.dart';
import '../land_form/land_form_controller.dart';
import '../polluation_sources/polluation_sources_controller.dart';
import '../pollutant_place/pollutant_place_controller.dart';
import '../pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../potential_pollutants/potential_pollutants_controller.dart';
import '../report_industrial_activites/get_industrial_activities_controller.dart';
import '../report_industrial_polluation_source/industrial_polluation_source_controller.dart';
import '../surface_water/surface_water_controller.dart';
import '../surrounding_buildings/surrounding_buildings_controller.dart';
import '../weather/weather_controller.dart';
import 'ground_water_controller.dart';
import 'residential_area_controller.dart';
import 'vegetation_controller.dart';

class SubmitReportController extends GetxController {
  RxBool loading = true.obs;

  //! Controllers
  CurrentLocationController location = Get.find<CurrentLocationController>();
  ResidentialAreaRadioController resCtrl =
      Get.find<ResidentialAreaRadioController>();
  VegetationRadioController vegCtrl = Get.put(VegetationRadioController());
  GroundWaterRadioController groundCtrl = Get.put(GroundWaterRadioController());

  AllLandFormController landFormCtrl = Get.put(AllLandFormController());
  AllPollutantReactivitiesController pollutantReactivitiesCtrl =
      Get.put(AllPollutantReactivitiesController());
  PollutantPlaceController pollutantPlaceCtrl =
      Get.put(PollutantPlaceController());
  SurfaceWaterController surfaceWaterCtrl = Get.put(SurfaceWaterController());
  WeatherController weatherCtrl = Get.put(WeatherController());
  AllIndustrialActivitiesController industrialActivitiesCtrl =
      Get.put(AllIndustrialActivitiesController());
  AllIndustrialPolluationSourceController industrialPolluationSourceCtrl =
      Get.put(AllIndustrialPolluationSourceController());
  AllPolluationSourcesController polluationSourcesCtrl =
      Get.put(AllPolluationSourcesController());

  AllPotentialPollutantsController potentialPollutantsCtrl =
      Get.put(AllPotentialPollutantsController());

  AllSurroundingBuildingsController surroundingBuildingsCtrl =
      Get.put(AllSurroundingBuildingsController());

  void submitReport({
    required int cityId,
    required int epicenterId,
    required List<File> imagesList,
    required BuildContext context,
    required String extentOfPolluationDescription,
    required double epicenterSize,
    required double polluationSize,
     temperature='0.0',
     salinity='0.0',
     totalDissolvedSolids='0.0',
     totalSuspendedSolids='0.0',
     pH='0.0',
     turbidity='0.0',
     electricalConnection='0.0',
     dissolvedOxygen='0.0',
     totalOrganicCarbon='0.0',
     volatileOrganicMatter='0.0',
     ozone='0.0',
     allKindsOfCarbon='0.0',
     nitrogenDioxide='0.0',
     sulfurDioxide='0.0',
     pM25='0.0',
     pM10='0.0',
  }) {
    if (cityId == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter city'.tr)));
    }
    else if (imagesList.isEmpty  ) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('please enter HotSpot Images'.tr)));
    }
    else if (polluationSourcesCtrl.polluationSourcesIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('please enter Polluation Sources'.tr)));
    }
    else if (location.currentLat == Constants.emptyDouble &&
        location.currentLong == Constants.emptyDouble) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('please choose location of HotSpot'.tr)));
    }
    else if (landFormCtrl.landFormId.value == Constants.zero) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter Land Form'.tr)));
    }
    else if (pollutantReactivitiesCtrl.pollutantReactivitiesId.value ==
        Constants.zero) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please Enter Pollutant Reactivities".tr)));
    }
    else if (pollutantPlaceCtrl.pollutantPlaceId.value == Constants.zero) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please Enter Pollutant Places".tr)));
    }
    else if (surfaceWaterCtrl.surfaceWaterId.value == Constants.zero) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please select Surface Water".tr)));
    }
    else if (industrialActivitiesCtrl.industrialActivitiesIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("please enter Industrial Activites".tr)));
    }
    else if (industrialPolluationSourceCtrl.industrialPolluationSourceIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("please Enter Industrial Polluation Source".tr)));
    }
    else if (polluationSourcesCtrl.polluationSourcesIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Enter Polluation Source".tr)));
    }
    else if (potentialPollutantsCtrl.potentialPollutantsIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Enter Potential Pollutants ".tr)));
    }
    else if (surroundingBuildingsCtrl.surroundingBuildingsIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Enter Surrounding Buildings ".tr)));
    }

    else if (surroundingBuildingsCtrl.surroundingBuildingsIds == []) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Enter Surrounding Buildings ".tr)));
    } else {
      log("""
        extentOfPolluationDescription:$extentOfPolluationDescription
        photos:$imagesList
        lat:${ location.currentLat}
        long:${ location.currentLong}
        hasResidentialArea:${
            resCtrl.charcter == ResidentialAreaRadio.yes ? true :false}
        hasVegetation:${ vegCtrl.charcter == VegetationRadio.yes ? true : false}
        hasGroundWater:${
            groundCtrl.charcter == GroundWaterRadio.yes ? true :false}
        epicenterSize:${ epicenterSize.toString()}
        polluationSize:${ polluationSize.toString()}
        epicenterId:$epicenterId
        cityId:$cityId
        landFormId:${ landFormCtrl.landFormId.value}
        pollutantReactivityId:${
            pollutantReactivitiesCtrl.pollutantReactivitiesId.value}
        pollutantPlaceId:${ pollutantPlaceCtrl.pollutantPlaceId.value}
        surfaceWaterId:${ surfaceWaterCtrl.surfaceWaterId.value}
        weatherId:${ weatherCtrl.weatherId.value},
        reportIndustrialActivitiesIds:
        ${industrialActivitiesCtrl.industrialActivitiesIds}
        reportIndustrialPolluationSourcesIds:${
            industrialPolluationSourceCtrl.industrialPolluationSourceIds}
        reportPolluationSourcesIds:${ polluationSourcesCtrl.polluationSourcesIds}
        reportPotentialPollutantsIds:${
            potentialPollutantsCtrl.potentialPollutantsIds}
        reportSurroundingBuildingsIds:${
            surroundingBuildingsCtrl.surroundingBuildingsIds}
        temperature:${ temperature.toString()}
        salinity:${ salinity.toString()}
        totalDissolvedSolids:${ totalDissolvedSolids.toString()}
        totalSuspendedSolids:${ totalSuspendedSolids.toString()}
        pH:${ pH.toString()}
        turbidity:${ turbidity.toString()}
        electricalConnection:${ electricalConnection.toString()}
        dissolvedOxygen:${ dissolvedOxygen.toString()}
        totalOrganicCarbon:${ totalOrganicCarbon.toString()}
        volatileOrganicMatter:${ volatileOrganicMatter.toString()}
        ozone:${ ozone.toString()}
        allKindsOfCarbon:${ allKindsOfCarbon.toString()}
        nitrogenDioxide:${ nitrogenDioxide.toString()}
        sulfurDioxide:${ sulfurDioxide.toString()}
        pM25:${ pM25.toString()}
        pM10:${ pM10.toString()}
""");
      AddReportService.sendReport(
          allData: ReportModel(
        extentOfPolluationDescription: extentOfPolluationDescription,
        photos: imagesList,
        lat: location.currentLat,
        long: location.currentLong,
        hasResidentialArea:
            resCtrl.charcter == ResidentialAreaRadio.yes ? true : false,
        hasVegetation: vegCtrl.charcter == VegetationRadio.yes ? true : false,
        hasGroundWater:
            groundCtrl.charcter == GroundWaterRadio.yes ? true : false,
        epicenterSize: epicenterSize.toString(),
        polluationSize: polluationSize.toString(),
        epicenterId: epicenterId,
        cityId: cityId,
        landFormId: landFormCtrl.landFormId.value,
        pollutantReactivityId:
            pollutantReactivitiesCtrl.pollutantReactivitiesId.value,
        pollutantPlaceId: pollutantPlaceCtrl.pollutantPlaceId.value,
        surfaceWaterId: surfaceWaterCtrl.surfaceWaterId.value,
        weatherId: weatherCtrl.weatherId.value,
        reportIndustrialActivitiesIds:
            industrialActivitiesCtrl.industrialActivitiesIds,
        reportIndustrialPolluationSourcesIds:
            industrialPolluationSourceCtrl.industrialPolluationSourceIds,
        reportPolluationSourcesIds: polluationSourcesCtrl.polluationSourcesIds,
        reportPotentialPollutantsIds:
            potentialPollutantsCtrl.potentialPollutantsIds,
        reportSurroundingBuildingsIds:
            surroundingBuildingsCtrl.surroundingBuildingsIds,
        temperature: temperature??'0.0',
        salinity: salinity??'0.0',
        totalDissolvedSolids: totalDissolvedSolids??'0.0',
        totalSuspendedSolids: totalSuspendedSolids??'0.0',
        pH: pH??'0.0',
        turbidity: turbidity??'0.0',
        electricalConnection: electricalConnection??'0.0',
        dissolvedOxygen: dissolvedOxygen??'0.0',
        totalOrganicCarbon: totalOrganicCarbon??'0.0',
        volatileOrganicMatter: volatileOrganicMatter??'0.0',
        ozone: ozone??'0.0',
        allKindsOfCarbon: allKindsOfCarbon??'0.0',
        nitrogenDioxide: nitrogenDioxide??'0.0',
        sulfurDioxide: sulfurDioxide??'0.0',
        pM25: pM25??'0.0',
        pM10: pM10??'0.0',
      )).then((res) {
        if (res == 200) {
          print('success');
          loading.value = false;
          Get.defaultDialog(
            title: Constants.empty,
            middleText: AppStrings.sucuss,
            onConfirm: () => Get.back(),
            confirmTextColor: ColorManager.white,
            buttonColor: ColorManager.error,
            backgroundColor: ColorManager.white,
          );
          Get.offAll(() => HomeScreen());
        } else if (res == 400) {
          loading.value = false;
          Get.defaultDialog(
            title: AppStrings.error,
            middleText: AppStrings.errorMsg,
            onConfirm: () => Get.back(),
            confirmTextColor: ColorManager.white,
            buttonColor: ColorManager.error,
            backgroundColor: ColorManager.white,
          );
        } else if (res == 401) {
          Get.offAll(() => const LoginScreen());
        } else if (res == 500) {
          //!Server Error
          loading.value = false;

          Get.defaultDialog(
            title: AppStrings.serverErrorTitle,
            middleText: AppStrings.serverError,
            onConfirm: () => Get.back(),
            confirmTextColor: ColorManager.white,
            buttonColor: ColorManager.error,
            backgroundColor: ColorManager.white,
          );
        }
      });
    }
  }
}

