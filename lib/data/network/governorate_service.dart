import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/epicenter/epicenter_model.dart';
import '../../presentation/login/login_screen.dart';

class GovernorateService {
  static Future getGovernorate(int regionId) async {
    http.Response res = await http.get(
      Uri.parse("${Constants.governorateEndPoint}/$regionId"),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode 
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body);

      List<GovernorateModel> governorate = jsonData.map((element) {
        return GovernorateModel.fromJson(element);
      }).toList();

      return governorate;
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
