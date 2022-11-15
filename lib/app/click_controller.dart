import 'package:get/get.dart';

class ClickController extends GetxController {
  bool clicked = false;
  bool ownerClick = false;
  RxBool farmClick = false.obs;

  //!======== Camel=================*/
  RxBool camelHerdClick = false.obs;
  bool camelFarmDiseaseClick = false;
  bool camelhouseClick = false;
  bool camelFeedingClick = false;
  bool camelMilkerClick = false;
  bool camelReproductionClick = false;
  bool camelHealthClick = false;
  bool camelHealthOpertionalClick = false;
  bool camelImmunizationClick = false;
  bool camelLabClick = false;
  bool camelClinicalClick = false;
  bool camelSymptomsClick = false;
  RxBool camelGeneralClick = false.obs;

  //!======== Cow=================*/
  bool cowHerdClick = false;
  bool cowFarmDiseaseClick = false;
  bool cowhouseClick = false;
  bool cowFeedingClick = false;
  bool cowMilkerClick = false;
  bool cowReproductionClick = false;
  bool cowHealthClick = false;
  bool cowHealthOpertionalClick = false;
  bool cowImmunizationClick = false;
  bool cowLabClick = false;
  bool cowClinicalClick = false;
  bool cowSymptomsClick = false;
  bool cowGeneralClick = false;

  //!======== Goat =================*/
  bool goatHerdClick = false;
  bool goatFarmDiseaseClick = false;
  bool goathouseClick = false;
  bool goatFeedingClick = false;
  bool goatMilkerClick = false;
  bool goatReproductionClick = false;
  bool goatHealthClick = false;
  bool goatHealthOpertionalClick = false;
  bool goatImmunizationClick = false;
  bool goatLabClick = false;
  bool goatClinicalClick = false;
  bool goatSymptomsClick = false;
  bool goatGeneralClick = false;

  //!======== Sheep =================*/
  bool sheepHerdClick = false;
  bool sheepFarmDiseaseClick = false;
  bool sheephouseClick = false;
  bool sheepFeedingClick = false;
  bool sheepMilkerClick = false;
  bool sheepReproductionClick = false;
  bool sheepHealthClick = false;
  bool sheepHealthOpertionalClick = false;
  bool sheepImmunizationClick = false;
  bool sheepLabClick = false;
  bool sheepClinicalClick = false;
  bool sheepSymptomsClick = false;
  bool sheepGeneralClick = false;

//!======== Horse =================*/
  bool horseHerdClick = false;
  bool horseFarmDiseaseClick = false;
  bool horsehouseClick = false;
  bool horseFeedingClick = false;
  bool horseMilkerClick = false;
  bool horseReproductionClick = false;
  bool horseHealthClick = false;
  bool horseHealthOpertionalClick = false;
  bool horseImmunizationClick = false;
  bool horseLabClick = false;
  bool horseClinicalClick = false;
  bool horseSymptomsClick = false;
  bool horseGeneralClick = false;

  void changeClick() {
    clicked = !clicked;
    update();
  }

  void changeOwnerClick() {
    ownerClick = !ownerClick;
    update();
  }

  void changeFarmClick() {
    farmClick.value = !farmClick.value;
    update();
  }

//!======== Camel =================*/

  void changeCamelHerdClick() {
    camelHerdClick.value = !camelHerdClick.value;
    update();
  }

  void changeCamelFarmDiseaseClick() {
    camelFarmDiseaseClick = !camelFarmDiseaseClick;
    update();
  }

  void changeCamelhouseClick() {
    camelhouseClick = !camelhouseClick;
    update();
  }

  void changeCamelFeedingClick() {
    camelFeedingClick = !camelFeedingClick;
    update();
  }

  void changeCamelGeneralClick() {
    camelGeneralClick.value = !camelGeneralClick.value;
    update();
  }

  void changeCamelHealthClick() {
    camelHealthClick = !camelHealthClick;
    update();
  }

  void changeCamelHealthOpertionalClick() {
    camelHealthOpertionalClick = !camelHealthOpertionalClick;
    update();
  }

  void changeCamelImmunizationClick() {
    camelImmunizationClick = !camelImmunizationClick;
    update();
  }

  void changeCamelLabClick() {
    camelLabClick = !camelLabClick;
    update();
  }

  void changeCamelClinicalClick() {
    camelClinicalClick = !camelClinicalClick;
    update();
  }

  void changeCamelMilkerClick() {
    camelMilkerClick = !camelMilkerClick;
    update();
  }

  void changeCamelReproductionClick() {
    camelReproductionClick = !camelReproductionClick;
    update();
  }

  void changeCamelSymptomsClick() {
    camelSymptomsClick = !camelSymptomsClick;
    update();
  }

  //!======== Cow =================*/

  void changecowHerdClick() {
    cowHerdClick = !cowHerdClick;
    update();
  }

  void changecowFarmDiseaseClick() {
    cowFarmDiseaseClick = !cowFarmDiseaseClick;
    update();
  }

  void changecowhouseClick() {
    cowhouseClick = !cowhouseClick;
    update();
  }

  void changecowFeedingClick() {
    cowFeedingClick = !cowFeedingClick;
    update();
  }

  void changecowGeneralClick() {
    cowGeneralClick = !cowGeneralClick;
    update();
  }

  void changecowHealthClick() {
    cowHealthClick = !cowHealthClick;
    update();
  }

  void changecowHealthOpertionalClick() {
    cowHealthOpertionalClick = !cowHealthOpertionalClick;
    update();
  }

  void changecowImmunizationClick() {
    cowImmunizationClick = !cowImmunizationClick;
    update();
  }

  void changecowLabClick() {
    cowLabClick = !cowLabClick;
    update();
  }

  void changecowClinicalClick() {
    cowClinicalClick = !cowClinicalClick;
    update();
  }

  void changecowMilkerClick() {
    cowMilkerClick = !cowMilkerClick;
    update();
  }

  void changecowReproductionClick() {
    cowReproductionClick = !cowReproductionClick;
    update();
  }

  void changecowSymptomsClick() {
    cowSymptomsClick = !cowSymptomsClick;
    update();
  }

  //!======== Goat =================*/
  void changegoatHerdClick() {
    goatHerdClick = !goatHerdClick;
    update();
  }

  void changegoatFarmDiseaseClick() {
    goatFarmDiseaseClick = !goatFarmDiseaseClick;
    update();
  }

  void changegoathouseClick() {
    goathouseClick = !goathouseClick;
    update();
  }

  void changegoatFeedingClick() {
    goatFeedingClick = !goatFeedingClick;
    update();
  }

  void changegoatGeneralClick() {
    goatGeneralClick = !goatGeneralClick;
    update();
  }

  void changegoatHealthClick() {
    goatHealthClick = !goatHealthClick;
    update();
  }

  void changegoatHealthOpertionalClick() {
    goatHealthOpertionalClick = !goatHealthOpertionalClick;
    update();
  }

  void changegoatImmunizationClick() {
    goatImmunizationClick = !goatImmunizationClick;
    update();
  }

  void changegoatLabClick() {
    goatLabClick = !goatLabClick;
    update();
  }

  void changegoatClinicalClick() {
    goatClinicalClick = !goatClinicalClick;
    update();
  }

  void changegoatMilkerClick() {
    goatMilkerClick = !goatMilkerClick;
    update();
  }

  void changegoatReproductionClick() {
    goatReproductionClick = !goatReproductionClick;
    update();
  }

  void changegoatSymptomsClick() {
    goatSymptomsClick = !goatSymptomsClick;
    update();
  }

  //!======== Sheep =================*/

  void changesheepHerdClick() {
    sheepHerdClick = !sheepHerdClick;
    update();
  }

  void changesheepFarmDiseaseClick() {
    sheepFarmDiseaseClick = !sheepFarmDiseaseClick;
    update();
  }

  void changesheephouseClick() {
    sheephouseClick = !sheephouseClick;
    update();
  }

  void changesheepFeedingClick() {
    sheepFeedingClick = !sheepFeedingClick;
    update();
  }

  void changesheepGeneralClick() {
    sheepGeneralClick = !sheepGeneralClick;
    update();
  }

  void changesheepHealthClick() {
    sheepHealthClick = !sheepHealthClick;
    update();
  }

  void changesheepHealthOpertionalClick() {
    sheepHealthOpertionalClick = !sheepHealthOpertionalClick;
    update();
  }

  void changesheepImmunizationClick() {
    sheepImmunizationClick = !sheepImmunizationClick;
    update();
  }

  void changesheepLabClick() {
    sheepLabClick = !sheepLabClick;
    update();
  }

  void changesheepClinicalClick() {
    sheepClinicalClick = !sheepClinicalClick;
    update();
  }

  void changesheepMilkerClick() {
    sheepMilkerClick = !sheepMilkerClick;
    update();
  }

  void changesheepReproductionClick() {
    sheepReproductionClick = !sheepReproductionClick;
    update();
  }

  void changesheepSymptomsClick() {
    sheepSymptomsClick = !sheepSymptomsClick;
    update();
  }

  //!======== Horse =================*/
  void changehorseHerdClick() {
    horseHerdClick = !horseHerdClick;
    update();
  }

  void changehorseFarmDiseaseClick() {
    horseFarmDiseaseClick = !horseFarmDiseaseClick;
    update();
  }

  void changehorsehouseClick() {
    horsehouseClick = !horsehouseClick;
    update();
  }

  void changehorseFeedingClick() {
    horseFeedingClick = !horseFeedingClick;
    update();
  }

  void changehorseGeneralClick() {
    horseGeneralClick = !horseGeneralClick;
    update();
  }

  void changehorseHealthClick() {
    horseHealthClick = !horseHealthClick;
    update();
  }

  void changehorseHealthOpertionalClick() {
    horseHealthOpertionalClick = !horseHealthOpertionalClick;
    update();
  }

  void changehorseImmunizationClick() {
    horseImmunizationClick = !horseImmunizationClick;
    update();
  }

  void changehorseLabClick() {
    horseLabClick = !horseLabClick;
    update();
  }

  void changehorseClinicalClick() {
    horseClinicalClick = !horseClinicalClick;
    update();
  }

  void changehorseMilkerClick() {
    horseMilkerClick = !horseMilkerClick;
    update();
  }

  void changehorseReproductionClick() {
    horseReproductionClick = !horseReproductionClick;
    update();
  }

  void changehorseSymptomsClick() {
    horseSymptomsClick = !horseSymptomsClick;
    update();
  }
}
