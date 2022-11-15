import 'package:get/get.dart';

import '../../data/controller/epicenter/add_epicenter_controller.dart';
import '../../data/controller/epicenter/all_epicenter_controller.dart';
import '../../data/controller/land_form/land_form_controller.dart';
import '../../data/controller/polluation_sources/polluation_sources_controller.dart';
import '../../data/controller/pollutant_place/pollutant_place_controller.dart';
import '../../data/controller/pollutant_reactivities/pollutant_reactivities_controller.dart';
import '../../data/controller/potential_pollutants/potential_pollutants_controller.dart';
import '../../data/controller/report/ground_water_controller.dart';
import '../../data/controller/report/residential_area_controller.dart';
import '../../data/controller/report/vegetation_controller.dart';
import '../../data/controller/report_industrial_activites/get_industrial_activities_controller.dart';
import '../../data/controller/report_industrial_polluation_source/industrial_polluation_source_controller.dart';
import '../../data/controller/surface_water/surface_water_controller.dart';
import '../../data/controller/surrounding_buildings/surrounding_buildings_controller.dart';
import '../../data/controller/weather/weather_controller.dart';
import '../current_location_controller.dart';
import '../internet_connectivity_controller.dart';

class IntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetController>(() => InternetController(), fenix: true);
    Get.lazyPut<CurrentLocationController>(() => CurrentLocationController(),
        fenix: true);
    Get.lazyPut<PollutantPlaceController>(() => PollutantPlaceController(),
        fenix: true);
    Get.lazyPut<AllLandFormController>(() => AllLandFormController(),
        fenix: true);
    Get.lazyPut<AllPollutantReactivitiesController>(
        () => AllPollutantReactivitiesController(),
        fenix: true);
    Get.lazyPut<SurfaceWaterController>(() => SurfaceWaterController(),
        fenix: true);
    Get.lazyPut<WeatherController>(() => WeatherController(), fenix: true);
    Get.lazyPut<AllEpicenterController>(() => AllEpicenterController(),
        fenix: true);

    Get.lazyPut<ResidentialAreaRadioController>(
        () => ResidentialAreaRadioController(),
        fenix: true);
    Get.lazyPut<VegetationRadioController>(() => VegetationRadioController(),
        fenix: true);
    Get.lazyPut<GroundWaterRadioController>(() => GroundWaterRadioController(),
        fenix: true);

    Get.lazyPut<SurfaceWaterController>(() => SurfaceWaterController(),
        fenix: true);

    Get.lazyPut<WeatherController>(() => WeatherController(), fenix: true);
    Get.lazyPut<AllIndustrialActivitiesController>(
        () => AllIndustrialActivitiesController(),
        fenix: true);

    Get.lazyPut<AllIndustrialPolluationSourceController>(
        () => AllIndustrialPolluationSourceController(),
        fenix: true);
    Get.lazyPut<AllPolluationSourcesController>(
        () => AllPolluationSourcesController(),
        fenix: true);
    Get.lazyPut<AllPotentialPollutantsController>(
        () => AllPotentialPollutantsController(),
        fenix: true);
    Get.lazyPut<AllSurroundingBuildingsController>(
        () => AllSurroundingBuildingsController(),
        fenix: true);
    Get.lazyPut<AddEpicenterController>(() => AddEpicenterController(),
        fenix: true);
  }
}
