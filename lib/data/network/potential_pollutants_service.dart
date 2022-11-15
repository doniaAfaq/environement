import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/potential_pollutants/potential_pollutants_model.dart';
import '../../presentation/login/login_screen.dart';

class PotentialPollutantsService {
  static Future getAllPotentialPollutants() async {
    http.Response res = await http.get(
      Uri.parse(Constants.allPotentialPollutantsEndPoint),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body);

      List<PotentialPollutantsModel> potentialPollutants =
          jsonData.map((element) {
        return PotentialPollutantsModel.fromJson(element);
      }).toList();

      return potentialPollutants;
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
