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
import '../../domain/model/epicenter/add_epicenter_model.dart';

class AddEpicenterService {
  static Future sendEpicenter({
    required AddEpicenterModel allData,
  }) async {
    int reportPolluationSourcesIncrement = 0;

    final Uri url = Uri.parse(Constants.addEpicenterEndPoint);
    try {
      var headers = <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        "lang": Get.locale!.languageCode 
      };
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll(headers);
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
      for (var i = 0; i < allData.polluationSourcesIds.length; i++) {
        request.fields["PolluationSourcesIds[$reportPolluationSourcesIncrement]"] ="${allData.polluationSourcesIds[i]}";
        reportPolluationSourcesIncrement++;
      }

      //!=================================================================
      request.fields["Description"] = allData.description;
      request.fields["Lat"] = "${allData.lat}";
      request.fields["Long"] = "${allData.long}";
      request.fields["Reason"] = allData.reason;
      request.fields["size"] = allData.size;
      request.fields["CityId"] = "${allData.cityId}";
      //!=================================================================
      var res = await request.send();
      var responseStream = await res.stream.bytesToString();
      if (res.statusCode == 200 || res.statusCode == 201) {
        log("res.stream.bytesToString() : ${responseStream.runtimeType}");
        return responseStream;
      } else if (res.statusCode == 400) {
   
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
