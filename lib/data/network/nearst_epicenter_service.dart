import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/epicenter/epicenter_model.dart';
import '../../presentation/login/login_screen.dart';

class NearstEpicenterServices {
  static Future getNearstEpicenter(
    int status,
    double lat,
    double long,
  ) async {
    http.Response res = await http.get(
      Uri.parse(
          "${Constants.nearstEpicenterEndPoint}/$lat/$long/${Constants.closestPointNumber}?status=$status"),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body);

      List<EpicenterModel> nearstEpicenters = jsonData.map((element) {
        return EpicenterModel.fromJson(element);
      }).toList();

      return nearstEpicenters;
    } else if (res.statusCode == 401 || res.statusCode == 403) {
      Get.offAll(() => const LoginScreen());
    } else if (res.statusCode == 500 ||
        res.statusCode == 501 ||
        res.statusCode == 504 ||
        res.statusCode == 502) {
      log("error 500 = $res");
      return 500;
    }
    log("error 400 = ${res.statusCode}");
    return 400;
  }
}
