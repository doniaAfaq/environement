class Constants {
  static const String url = 'environmentApp.afaqci.com';
  static const String baseUrl = "https://environmentApp.afaqci.com/api";
  static const String photoUrl =
      "https://environmentApp.afaqci.com/Files/Photos";
  static const String epicenterPhotoUrl = "$photoUrl/Epicenters/";
  static const int closestPointNumber = 10;
  static const String empty = "";
  static const double emptyDouble = 0.0;
  static const int zero = 0;
  static const List emptyList = [];

  static const int apiTimeOut = 60 * 1000;
  static const String token = "";
  static const String loginEndPoint = "$baseUrl/Account/Login";
  static const String allEpicenterEndPoint =
      "$baseUrl/Epicenters/GetAllEpicenters";
  static const String allLandFormEndPoint =
      "$baseUrl/LandForms/GetAllLandForms";
  static const String allPollutantReactivitiesEndPoint =
      "$baseUrl/PollutantReactivities/GetAllPollutantReactivities";
  static const String allPollutantPlaceEndPoint =
      "$baseUrl/PollutantPlaces/GetAllPollutantPlaces";
  static const String allSurfaceWaterEndPoint =
      "$baseUrl/SurfaceWaters/GetAllSurfaceWaters";
  static const String allWeatherEndPoint = "$baseUrl/Weathers/GetAllWeathers";
  static const String regionEndPoint = "$baseUrl/Regions/GetAllRegions";
  static const String governorateEndPoint =
      "$baseUrl/Governorates/GetRegionGovernorates";
  static const String citiesEndPoint = "$baseUrl/Cities/GetGovernorateCities";

  static const String industrialActivitiesEndPoint =
      "$baseUrl/IndustrialActivities/GetAllIndustrialActivities";
  static const String industrialPolluationSourceEndPoint =
      "$baseUrl/IndustrialPolluationSources/GetAllIndustrialPolluationSources";
  static const String polluationSourceEndPoint =
      "$baseUrl/PolluationSources/GetAllPolluationSources";

  static const String allPotentialPollutantsEndPoint =
      "$baseUrl/PotentialPollutants/GetAllPotentialPollutants";
  static const String allSurroundingBuildingssEndPoint =
      "$baseUrl/SurroundingBuildings/GetAllSurroundingBuildings";
  static const String addReportEndPoint = "$baseUrl/Reports/AddReport";
  static const String addEpicenterEndPoint = "$baseUrl/Epicenters/AddEpicenter";
  static const String nearstEpicenter = "api/Epicenters/GetClosestEpicenters";
  static const String nearstEpicenterEndPoint = "$baseUrl/Epicenters/GetClosestEpicenters";


}
