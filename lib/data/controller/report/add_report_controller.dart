import 'package:get/get.dart';

import '../../../app/constants.dart';

class AddReportController extends GetxController {
  String extentOfPolluationDescription = Constants.empty;
  double epicenterSize = 0.0;
  double polluationSize = 0.0;
  //!===============================
  String temperature = '0.0';
  String salinity = '0.0';
  String totalDissolvedSolids = '0.0';
  String totalSuspendedSolids = '0.0';
  String pH = '0.0';
  String turbidity = '0.0';
  String electricalConnection = '0.0';
  String dissolvedOxygen = '0.0';
  String totalOrganicCarbon = '0.0';
  String volatileOrganicMatter = '0.0';
  String ozone = '0.0';
  String allKindsOfCarbon = '0.0';
  String nitrogenDioxide = '0.0';
  String sulfurDioxide = '0.0';
  String pM25 = '0.0';
  String pM10 = '0.0';

  void changeExtentOfPolluationDescription(String? value) {
    extentOfPolluationDescription = value ?? Constants.empty;
    update();
  }

  void changeEpicenterSize(String? value) {
    epicenterSize = double.parse(value ?? "0.0");
    update();
  }

  void changePolluationSize(String? value) {
    polluationSize = double.parse(value ?? "0.0");
    update();
  }

  void changetemperature(String? value) {
    temperature = value ?? "0.0";
    update();
  }

  void changesalinity(String? value) {
    salinity = value ?? "0.0";
    update();
  }

  void changetotalDissolvedSolids(String? value) {
    totalDissolvedSolids = value ?? "0.0";
    update();
  }

  void changetotalSuspendedSolids(String? value) {
    totalSuspendedSolids = value ?? "0.0";
    update();
  }

  void changepH(String? value) {
    pH = value ?? "0.0";
    update();
  }

  void changeturbidity(String? value) {
    turbidity = value ?? "0.0";
    update();
  }

  void changeelectricalConnection(String? value) {
    electricalConnection = value ?? "0.0";
    update();
  }

  void changedissolvedOxygen(String? value) {
    dissolvedOxygen = value ?? "0.0";
    update();
  }

  void changetotalOrganicCarbon(String? value) {
    totalOrganicCarbon = value ?? "0.0";
    update();
  }

  void changevolatileOrganicMatter(String? value) {
    volatileOrganicMatter = value ?? "0.0";
    update();
  }

  void changeozone(String? value) {
    ozone = value ?? "0.0";
    update();
  }

  void changeallKindsOfCarbon(String? value) {
    allKindsOfCarbon = value ?? "0.0";
    update();
  }

  void changenitrogenDioxide(String? value) {
    nitrogenDioxide = value ?? "0.0";
    update();
  }

  void changesulfurDioxide(String? value) {
    sulfurDioxide = value ?? "0.0";
    update();
  }

  void changepM25(String? value) {
    pM25 = value ?? "0.0";
    update();
  }

  void changepM10(String? value) {
    pM10 = value ?? "0.0";
    update();
  }
}
