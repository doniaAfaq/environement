import 'dart:io';

import '../../../app/constants.dart';

class ReportModel {
  final String extentOfPolluationDescription;
  final double lat;
  final double long;
  final bool hasResidentialArea;
  final bool hasVegetation;
  final bool hasGroundWater;
  final String epicenterSize;
  final String polluationSize;
  final int epicenterId;
  final int cityId;
  final int landFormId;
  final int pollutantReactivityId;
  final int pollutantPlaceId;
  final int surfaceWaterId;
  final int weatherId;
  final List<File> photos;
  final List<int> reportIndustrialActivitiesIds;
  final List<int> reportIndustrialPolluationSourcesIds;
  final List<int> reportPolluationSourcesIds;
  final List<int> reportPotentialPollutantsIds;
  final List<int> reportSurroundingBuildingsIds;
  final String? temperature;
  final String? salinity;
  final String? totalDissolvedSolids;
  final String? totalSuspendedSolids;
  final String? pH;
  final String? turbidity;
  final String? electricalConnection;
  final String? dissolvedOxygen;
  final String? totalOrganicCarbon;
  final String? volatileOrganicMatter;
  final String? ozone;
  final String? allKindsOfCarbon;
  final String? nitrogenDioxide;
  final String? sulfurDioxide;
  final String? pM25;
  final String? pM10;

  ReportModel({
    required this.extentOfPolluationDescription,
    required this.photos,
    required this.lat,
    required this.long,
    required this.hasResidentialArea,
    required this.hasVegetation,
    required this.hasGroundWater,
    required this.epicenterSize,
    required this.polluationSize,
    required this.epicenterId,
    required this.cityId,
    required this.landFormId,
    required this.pollutantReactivityId,
    required this.pollutantPlaceId,
    required this.surfaceWaterId,
    required this.weatherId,
    required this.reportIndustrialActivitiesIds,
    required this.reportIndustrialPolluationSourcesIds,
    required this.reportPolluationSourcesIds,
    required this.reportPotentialPollutantsIds,
    required this.reportSurroundingBuildingsIds,
      this.temperature ='0.0',
      this.salinity='0.0',
      this.totalDissolvedSolids='0.0',
      this.totalSuspendedSolids='0.0',
      this.pH='0.0',
      this.turbidity='0.0',
      this.electricalConnection='0.0',
      this.dissolvedOxygen='0.0',
      this.totalOrganicCarbon='0.0',
      this.volatileOrganicMatter='0.0',
      this.ozone='0.0',
      this.allKindsOfCarbon='0.0',
      this.nitrogenDioxide='0.0',
      this.sulfurDioxide='0.0',
      this.pM25='0.0',
      this.pM10='0.0',
  });

  factory ReportModel.fromJson(Map<String, dynamic> jsonData) {
    return ReportModel(
      extentOfPolluationDescription:
          jsonData['ExtentOfPolluationDescription'] ?? Constants.empty,
      long: jsonData['Long'] ?? 0.0,
      lat: jsonData['Lat'] ?? 0.0,
      photos: jsonData['Photos'] ?? [],
      hasResidentialArea: jsonData['HasResidentialArea'] ?? true,
      hasVegetation: jsonData['HasVegetation'] ?? true,
      hasGroundWater: jsonData['HasGroundWater'] ?? true,
      epicenterSize: jsonData['EpicenterSize'] ?? "0.0",
      polluationSize: jsonData['PolluationSize'] ?? " 0.0",
      epicenterId: jsonData['EpicenterId'] ?? 0,
      cityId: jsonData['CityId'] ?? 0,
      landFormId: jsonData['LandFormId'] ?? 0,
      pollutantReactivityId: jsonData['PollutantReactivityId'] ?? 0,
      pollutantPlaceId: jsonData['PollutantPlaceId'] ?? 0,
      surfaceWaterId: jsonData['SurfaceWaterId'] ?? 0,
      weatherId: jsonData['WeatherId'] ?? 0,
      reportIndustrialActivitiesIds:
          jsonData['ReportIndustrialActivitiesIds'] ?? [],
      reportIndustrialPolluationSourcesIds:
          jsonData['ReportIndustrialPolluationSourcesIds'] ?? [],
      reportPolluationSourcesIds: jsonData['ReportPolluationSourcesIds'] ?? [],
      reportPotentialPollutantsIds:
          jsonData['ReportPotentialPollutantsIds'] ?? [],
      reportSurroundingBuildingsIds:
          jsonData['ReportSurroundingBuildingsIds'] ?? [],
      temperature: jsonData['Temperature'] ?? '0.0',
      salinity: jsonData['Salinity'] ?? '0.0',
      totalDissolvedSolids: jsonData['TotalDissolvedSolids'] ?? '0.0',
      totalSuspendedSolids: jsonData['TotalSuspendedSolids'] ?? '0.0',
      pH: jsonData['PH'] ?? '0.0',
      turbidity: jsonData['Turbidity'] ?? '0.0',
      electricalConnection: jsonData['ElectricalConnection'] ?? '0.0',
      dissolvedOxygen: jsonData['DissolvedOxygen'] ?? '0.0',
      totalOrganicCarbon: jsonData['TotalOrganicCarbon'] ?? '0.0',
      volatileOrganicMatter: jsonData['VolatileOrganicMatter'] ?? '0.0',
      ozone: jsonData['Ozone'] ?? '0.0',
      allKindsOfCarbon: jsonData['AllKindsOfCarbon'] ?? '0.0',
      nitrogenDioxide: jsonData['NitrogenDioxide'] ?? '0.0',
      sulfurDioxide: jsonData['SulfurDioxide'] ?? '0.0',
      pM25: jsonData['PM25'] ?? '0.0',
      pM10: jsonData['PM10'] ?? '0.0',
    );
  }
}
