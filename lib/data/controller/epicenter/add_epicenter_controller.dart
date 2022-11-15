import 'package:get/get.dart';

import '../../../app/constants.dart';

class AddEpicenterController extends GetxController {
  String description = Constants.empty;
  double epicenterSize =Constants.emptyDouble;
  String reason = Constants.empty;
  double markLat = Constants.emptyDouble;
  double markLong = Constants.emptyDouble;
RxBool loading = true.obs;
  void setEpicenterLocation(double lat, double long) {
    markLat = lat;
    markLong = long;
    update();
  }

  void changeDescription(String? value) {
    description = value ?? Constants.empty;
    update();
  }

  void changeEpicenterSize(String? value) {
    epicenterSize = double.parse(value ?? "0.0");
    update();
  }

  void changeReason(String? value) {
    reason =  value ??Constants.empty;
    update();
  }
}
