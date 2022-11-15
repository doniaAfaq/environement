// ignore: duplicate_ignore

// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'dart:developer';

// ignore: implementation_imports
import 'package:async/src/delegate/stream.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/report/add_report_model.dart';

class AddReportService {
  static Future sendReport({
    required ReportModel allData,
  }) async {
    int industrialActivitiesIncrement = 0;
    int reportIndustrialPolluationSourcesIncrement = 0;
    int reportPolluationSourcesIncrement = 0;
    int reportPotentialPollutantsIncrement = 0;
    int reportSurroundingBuildingsIncrement = 0;

    final Uri url = Uri.parse(Constants.addReportEndPoint);
    try {
      var headers = <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      };
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll(headers);
      //!=================================================================
      //! add all images to request
      for (int i = 0; i < allData.photos.length; i++) {
        if (allData.photos[i].path != Constants.empty) {
          var stream = http.ByteStream(
              // ignore: deprecated_member_use
              DelegatingStream.typed(allData.photos[i].openRead()));
          var length = await allData.photos[i].length();
          var multipartFile1 = http.MultipartFile('Photos', stream, length,
              filename: basename(allData.photos[i].path));
          request.files.add(multipartFile1);
        }
      }
      //!=================================================================
      for (var i = 0; i < allData.reportIndustrialActivitiesIds.length; i++) {
        request.fields[
                "ReportIndustrialActivitiesIds[$industrialActivitiesIncrement]"] =
            "${allData.reportIndustrialActivitiesIds[i]}";
        industrialActivitiesIncrement++;
      }

      //!=================================================================
      for (var i = 0;
          i < allData.reportIndustrialPolluationSourcesIds.length;
          i++) {
        request.fields[
                "ReportIndustrialPolluationSourcesIds[$reportIndustrialPolluationSourcesIncrement]"] =
            "${allData.reportIndustrialPolluationSourcesIds[i]}";
        reportIndustrialPolluationSourcesIncrement++;
      }

      //!=================================================================
      for (var i = 0; i < allData.reportPolluationSourcesIds.length; i++) {
        request.fields[
                "ReportPolluationSourcesIds[$reportPolluationSourcesIncrement]"] =
            "${allData.reportPolluationSourcesIds[i]}";
        reportPolluationSourcesIncrement++;
      }

      //!=================================================================
      for (var i = 0; i < allData.reportPotentialPollutantsIds.length; i++) {
        request.fields[
                "ReportPotentialPollutantsIds[$reportPotentialPollutantsIncrement]"] =
            "${allData.reportPotentialPollutantsIds[i]}";
        reportPotentialPollutantsIncrement++;
      }

      //!=================================================================
      for (var i = 0; i < allData.reportSurroundingBuildingsIds.length; i++) {
        request.fields[
                "ReportSurroundingBuildingsIds[$reportSurroundingBuildingsIncrement]"] =
            "${allData.reportSurroundingBuildingsIds[i]}";
        reportSurroundingBuildingsIncrement++;
      }
      //!=================================================================
      request.fields["ExtentOfPolluationDescription"] =
          allData.extentOfPolluationDescription;
      request.fields["Lat"] = "${allData.lat}";
      request.fields["Long"] = "${allData.long}";
      request.fields["HasResidentialArea"] = "${allData.hasResidentialArea}";
      request.fields["HasVegetation"] = "${allData.hasVegetation}";
      request.fields["HasGroundWater"] = "${allData.hasGroundWater}";
      request.fields["EpicenterSize"] = allData.epicenterSize;
      request.fields["PolluationSize"] = allData.polluationSize;
      request.fields["EpicenterId"] = "${allData.epicenterId}";
      request.fields["CityId"] = "${allData.cityId}";
      request.fields["LandFormId"] = "${allData.landFormId}";
      request.fields["PollutantReactivityId"] =
          "${allData.pollutantReactivityId}";
      request.fields["PollutantPlaceId"] = "${allData.pollutantPlaceId}";
      request.fields["SurfaceWaterId"] = "${allData.surfaceWaterId}";
      request.fields["WeatherId"] = "${allData.weatherId}";
      request.fields["WeatherId"] = "${allData.weatherId}";
      request.fields['Temperature'] = allData.temperature??"0.0";
      request.fields['Salinity'] = allData.salinity??"0.0";
      request.fields['TotalDissolvedSolids'] = allData.totalDissolvedSolids??"0.0";
      request.fields['TotalSuspendedSolids'] = allData.totalSuspendedSolids??"0.0";
      request.fields['PH'] = allData.pH??"0.0";
      request.fields['Turbidity'] = allData.turbidity??"0.0";
      request.fields['ElectricalConnection'] = allData.electricalConnection??"0.0";
      request.fields['DissolvedOxygen'] = allData.dissolvedOxygen??"0.0";
      request.fields['TotalOrganicCarbon'] = allData.totalOrganicCarbon??"0.0";
      request.fields['VolatileOrganicMatter'] = allData.volatileOrganicMatter??"0.0";
      request.fields['Ozone'] = allData.ozone??"0.0";
      request.fields['AllKindsOfCarbon'] = allData.allKindsOfCarbon??"0.0";
      request.fields['NitrogenDioxide'] = allData.nitrogenDioxide??"0.0";
      request.fields['SulfurDioxide'] = allData.sulfurDioxide??"0.0";
      request.fields['PM25'] = allData.pM25??"0.0";
      request.fields['PM10'] = allData.pM10??"0.0";
      //!=================================================================
      var res = await request.send();
      var responseStream = await res.stream.bytesToString();
      if (res.statusCode == 200 || res.statusCode == 201) {
        return 200;
      } else if (res.statusCode == 400) {
        log("error 400 : ${res.reasonPhrase}");
        log("Response: $responseStream");
        return 400;
      } else if (res.statusCode == 401) {
        return 401;
      } else if (res.statusCode == 500 ||
          res.statusCode == 501 ||
          res.statusCode == 504) {
        return 500;
      }
    } catch (e) {
      log("error : $e");
      throw Exception("exception $e");
    }
  }
}
