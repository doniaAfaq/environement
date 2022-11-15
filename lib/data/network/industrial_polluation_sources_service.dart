import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/industrial_polluation_sources/industrial_polluation_sources_model.dart';
import '../../presentation/login/login_screen.dart';

class IndustrialPolluationSourceServices {
  static Future getAllIndustrialPolluationSource() async {
    http.Response res = await http.get(
      Uri.parse(Constants.industrialPolluationSourceEndPoint),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body) ;

      List<IndustrialPolluationSourcesModel> industrialPolluationSource = jsonData.map((element) {
        return IndustrialPolluationSourcesModel.fromJson(element);
      }).toList();

      return industrialPolluationSource;
    } else if (res.statusCode == 401 || res.statusCode == 403) {
      Get.offAll(() => const LoginScreen());
    } else if (res.statusCode == 500 ||
        res.statusCode == 501 ||
        res.statusCode == 504 ||
        res.statusCode == 502) {
      return 500;
    }
    return 400;
  }
}