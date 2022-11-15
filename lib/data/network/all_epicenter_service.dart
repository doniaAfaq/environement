import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../domain/model/epicenter/epicenter_model.dart';
import '../../presentation/login/login_screen.dart';

class AllEpicenterServices {
  static Future getAllEpicenter(int pageNum) async {
    http.Response res = await http.get(
      Uri.parse('https://environmentApp.afaqci.com/api/Epicenters/GetAllEpicenters?page=$pageNum&pageSize=10'),
      headers: <String, String>{
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${SharedPreferencesHelper.getTokenValue()}',
        'lang': Get.locale!.languageCode
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body)['epicenters'];
      String totalItem = jsonDecode(res.body)['count'];

      List<EpicenterModel> epicenters = jsonData.map((element) {
        return EpicenterModel.fromJson(element);
      }).toList();
      // return epicenters;
      return [epicenters,totalItem];

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
