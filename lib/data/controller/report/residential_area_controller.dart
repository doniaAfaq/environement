import 'package:get/get.dart';

enum ResidentialAreaRadio { yes, no }

class ResidentialAreaRadioController extends GetxController {
  ResidentialAreaRadio charcter = ResidentialAreaRadio.yes;

  void onChange(ResidentialAreaRadio value) {
    charcter = value;
    update();
  }
}
