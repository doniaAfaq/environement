import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../app/shared_widgets/label_widget.dart';
import '../../data/controller/location/governorate_controller.dart';
import '../../data/controller/location/region_controller.dart';
import '../../data/controller/report/add_report_controller.dart';
import '../../data/controller/report/ground_water_controller.dart';
import '../../data/controller/report/report_image_picker_controller.dart';
import '../../data/controller/report/residential_area_controller.dart';
import '../../data/controller/report/submit_report_controller.dart';
import '../../data/controller/report/vegetation_controller.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/governorate_widget.dart';
import 'widget/industrial_polluation_source_widget.dart';
import 'widget/land_form_widget.dart';
import 'widget/polluation_source_widget.dart';
import 'widget/pollutant_place_widget.dart';
import 'widget/pollutant_reactivities_widget.dart';
import 'widget/potential_pollutants_widget.dart';
import 'widget/region_widget.dart';
import 'widget/report_divider_widget.dart';
import 'widget/report_industrial_activities_widget.dart';
import 'widget/report_radio_widget.dart';
import 'widget/report_text_field_widget.dart';
import 'widget/surfae_water_widget.dart';
import 'widget/surrounding_buildings_widget.dart';
import 'widget/weather_widget.dart';

// ignore: must_be_immutable
class AddReportScreen extends StatelessWidget {
  AddReportScreen({Key? key, required this.epicenterId}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final int epicenterId;
  int cityId = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.primary,
        ),
        title: Center(
          child: Text(
            "Add Report".tr,
            overflow: TextOverflow.clip,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ),
      body: GetBuilder<AddReportController>(
          init: AddReportController(),
          builder: (reportCtrl) {
            return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p12,
                            horizontal: AppPadding.p18),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //!Extent Of Polluation Description
                              LabelWidget(
                                  label: 'Describe the extent of pollution'.tr),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppPadding.p12,
                                    right: AppPadding.p12,
                                    top: AppPadding.p12),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: ColorManager.secondary,
                                  style:
                                      TextStyle(color: ColorManager.secondary),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: AppSize.s2,
                                            color: ColorManager.secondary),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: AppSize.s2,
                                            color: ColorManager.secondary),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                      ),
                                      labelText:
                                          'Describe the extent of pollution'.tr,
                                      hintText:
                                          'Describe the extent of pollution'.tr,
                                      hintStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.grey),
                                      labelStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.secondary)),
                                  onSaved: (val) {
                                    reportCtrl
                                        .changeExtentOfPolluationDescription(
                                            val);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Description'.tr;
                                    }
                                    return null;
                                  }, // enabledBorder: InputBorder.none,
                                ),
                              ),
                              //? divider
                              const ReportDividerWidget(),
                              //!Epicenter Size
                              LabelWidget(label: "HotSpot Size".tr),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppPadding.p12,
                                    right: AppPadding.p12,
                                    top: AppPadding.p12),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: ColorManager.secondary,
                                  style:
                                      TextStyle(color: ColorManager.secondary),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: AppSize.s2,
                                            color: ColorManager.secondary),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: AppSize.s2,
                                            color: ColorManager.secondary),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                      ),
                                      labelText: "HotSpot Size".tr,
                                      hintText: "HotSpot Size".tr,
                                      hintStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.grey),
                                      labelStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.secondary)),
                                  onSaved: (val) {
                                    reportCtrl.changeEpicenterSize(val);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter HotSpot Size'.tr;
                                    }
                                    if (!value.isNum) {
                                      return 'Please enter Valid HotSpot Size'
                                          .tr;
                                    }
                                    if (value.length >= 12) {
                                      return 'Please enter Valid HotSpot Size'
                                          .tr;
                                    }
                                    return null;
                                  }, // enabledBorder: InputBorder.none,
                                ),
                              ),
                              //? divider
                              const ReportDividerWidget(),
                              //!Polluation Size
                              LabelWidget(label: "Polluation Size".tr),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppPadding.p12,
                                    right: AppPadding.p12,
                                    top: AppPadding.p12),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: ColorManager.secondary,
                                  style:
                                      TextStyle(color: ColorManager.secondary),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: AppSize.s2,
                                            color: ColorManager.secondary),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: AppSize.s2,
                                            color: ColorManager.secondary),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                      ),
                                      labelText: "Polluation Size".tr,
                                      hintText: "Polluation Size".tr,
                                      hintStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.grey),
                                      labelStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.secondary)),
                                  onSaved: (val) {
                                    reportCtrl.changePolluationSize(val);
                                  },

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Polluation Size'.tr;
                                    }
                                    if (!value.isNum) {
                                      return 'Please enter Valid Polluation Size'
                                          .tr;
                                    }
                                    if (value.length >= 12) {
                                      return 'Please enter Valid Polluation Size'
                                          .tr;
                                    }
                                    return null;
                                  }, // enabledBorder: InputBorder.none,
                                ),
                              ),
                              //? divider
                              const ReportDividerWidget(),
                              //!Residential Area
                              LabelWidget(
                                  label: "Is there Residential Area ?".tr),
                              GetBuilder<ResidentialAreaRadioController>(
                                  init: ResidentialAreaRadioController(),
                                  builder: (residentialAreaCtrl) {
                                    return ReportRadioWidget(
                                      enumName: ResidentialAreaRadio,
                                      yesValue: ResidentialAreaRadio.yes,
                                      onChangedYes: (val) =>
                                          residentialAreaCtrl.onChange(
                                              val ?? ResidentialAreaRadio.yes),
                                      noValue: ResidentialAreaRadio.no,
                                      onChangedNo: (val) =>
                                          residentialAreaCtrl.onChange(
                                              val ?? ResidentialAreaRadio.no),
                                      groupValue: residentialAreaCtrl.charcter,
                                    );
                                  }),
                              //? divider
                              const ReportDividerWidget(),
                              //!vegetation
                              LabelWidget(label: "Is there vegetation?".tr),
                              GetBuilder<VegetationRadioController>(
                                  init: VegetationRadioController(),
                                  builder: (vegetationCtrl) {
                                    return ReportRadioWidget(
                                      enumName: VegetationRadio,
                                      yesValue: VegetationRadio.yes,
                                      onChangedYes: (val) => vegetationCtrl
                                          .onChange(val ?? VegetationRadio.yes),
                                      noValue: VegetationRadio.no,
                                      onChangedNo: (val) => vegetationCtrl
                                          .onChange(val ?? VegetationRadio.no),
                                      groupValue: vegetationCtrl.charcter,
                                    );
                                  }),
                              //? divider
                              const ReportDividerWidget(),
                              //!ground water
                              LabelWidget(label: "Is there ground water ?".tr),
                              GetBuilder<GroundWaterRadioController>(
                                  init: GroundWaterRadioController(),
                                  builder: (groundWaterCtrl) {
                                    return ReportRadioWidget(
                                      enumName: GroundWaterRadio,
                                      yesValue: GroundWaterRadio.yes,
                                      onChangedYes: (val) =>
                                          groundWaterCtrl.onChange(
                                              val ?? GroundWaterRadio.yes),
                                      noValue: GroundWaterRadio.no,
                                      onChangedNo: (val) => groundWaterCtrl
                                          .onChange(val ?? GroundWaterRadio.no),
                                      groupValue: groundWaterCtrl.charcter,
                                    );
                                  }),
                              //? divider
                              const ReportDividerWidget(),
                              //!Land Form
                              LabelWidget(label: "Land Form ".tr),
                              const LandFormWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Pollutant Reactivities
                              LabelWidget(label: "Pollutant Reactivities".tr),
                              const PollutantReactivitiesWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Pollutant Place
                              LabelWidget(label: "Pollutant Places".tr),
                              const PollutantPlaceWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Surface Water
                              LabelWidget(label: "Surface Water".tr),
                              const SurfaceWaterWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Weather
                              LabelWidget(label: "Weather".tr),
                              const WeatherWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!location
                              LabelWidget(label: "Location".tr),
                              GetX<RegionController>(
                                  init: RegionController(),
                                  builder: (regionClr) {
                                    return Column(
                                      children: [
                                        const RegionWidget(),
                                        if (regionClr.regionId.value != 0)
                                          GetBuilder<GovernorateController>(
                                              init: GovernorateController(
                                                  regionClr.regionId.value),
                                              builder: (governoratCtrl) {
                                                return Column(
                                                  children: [
                                                    StatefulBuilder(builder:
                                                        (context, setter) {
                                                      setter(
                                                        () {
                                                          cityId =
                                                              governoratCtrl
                                                                  .governorateId
                                                                  .value;
                                                        },
                                                      );
                                                      return GovernorateWidget(
                                                          regionId: regionClr
                                                              .regionId.value);
                                                    }),
                                                  ],
                                                );
                                              }),
                                      ],
                                    );
                                  }),
                              //? divider
                              const ReportDividerWidget(),
                              //!add images and preview images
                              Container(
                                width: double.infinity,
                                height: SizeConfig.screenHeight! / MediaSize.m7,
                                decoration: BoxDecoration(
                                    color: ColorManager.lightGrey,
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br8)),
                                child: GetBuilder<ReportImagePickerController>(
                                    init: ReportImagePickerController(),
                                    builder: (imgCtrl) {
                                      return Row(
                                        children: [
                                          //! preview images
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: AppMargin.m8,
                                                      horizontal:
                                                          AppMargin.m12),
                                              child: ListView.builder(
                                                  itemCount:
                                                      imgCtrl.imagesList.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical:
                                                              AppMargin.m8,
                                                          horizontal:
                                                              AppMargin.m8),
                                                      width: SizeConfig
                                                              .screenWidth! /
                                                          MediaSize.m5,
                                                      height: SizeConfig
                                                              .screenWidth! /
                                                          MediaSize.m8,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: FileImage(
                                                                  imgCtrl.imagesList[
                                                                      index]),
                                                              fit:
                                                                  BoxFit.cover),
                                                          color: ColorManager
                                                              .black,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  BorderRadiusValues
                                                                      .br5)),
                                                    );
                                                  }),
                                            ),
                                          ),
                                          //! Add Icon
                                          InkWell(
                                            onTap: () {
                                              imgCtrl.pickImagesFormGallery();
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: AppMargin.m8),
                                              width: SizeConfig.screenWidth! /
                                                  MediaSize.m8,
                                              height: SizeConfig.screenWidth! /
                                                  MediaSize.m8,
                                              decoration: BoxDecoration(
                                                  color: ColorManager.secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          BorderRadiusValues
                                                              .br5)),
                                              child: Icon(
                                                Icons.add_photo_alternate,
                                                color: ColorManager.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              //? divider
                              const ReportDividerWidget(),
                              //!Industrial Activities
                              const ReportIndustrialActivitiesWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Industrial Polluation Source
                              const ReportIndustrialPolluationSourceWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Polluation Source
                              const ReportPolluationSourcesWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Potential Pollutants
                              const ReportPotentialPollutantsWidget(),
                              //? divider
                              const ReportDividerWidget(),
                              //!Surrounding Buildings
                              const ReportSurroundingBuildingsWidget(),
                              ReportTextFieldWidget(
                                  title: "Temperature".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changetemperature(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "Salinity".tr,
                                  type:  TextInputType.number,
                                 
                                  onSavedFunction: (val) {
                                    reportCtrl.changesalinity(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "TotalDissolvedSolids".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changetotalDissolvedSolids(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "TotalSuspendedSolids".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changetotalSuspendedSolids(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "PH".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changepH(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "Turbidity".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changeturbidity(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "ElectricalConnection".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changeelectricalConnection(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "DissolvedOxygen".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changedissolvedOxygen(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "TotalOrganicCarbon".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changetotalOrganicCarbon(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "VolatileOrganicMatter".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changevolatileOrganicMatter(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "Ozone".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changeozone(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "AllKindsOfCarbon".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changeallKindsOfCarbon(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "NitrogenDioxide".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changenitrogenDioxide(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "SulfurDioxide".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changesulfurDioxide(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "PM 25".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changepM25(val);
                                  }),
                              ReportTextFieldWidget(
                                  title: "PM 10".tr,
                                  type:  TextInputType.number,
                                  onSavedFunction: (val) {
                                    reportCtrl.changepM10(val);
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //!submit data
                    GetBuilder<ReportImagePickerController>(
                        init: ReportImagePickerController(),
                        builder: (imageCtrl) {
                          return GetX<SubmitReportController>(
                              init: SubmitReportController(),
                              builder: (submitCtrl) {
                                return InkWell(
                                  focusColor: ColorManager.primary,
                                  highlightColor: ColorManager.error,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      submitCtrl.submitReport(
                                        cityId: cityId,
                                        epicenterId: epicenterId,
                                        imagesList: imageCtrl.imagesList,
                                        context: context,
                                        extentOfPolluationDescription:
                                            reportCtrl
                                                .extentOfPolluationDescription,
                                        epicenterSize: reportCtrl.epicenterSize,
                                        polluationSize:
                                            reportCtrl.polluationSize,
                                        temperature: reportCtrl.temperature,
                                        salinity: reportCtrl.salinity,
                                        totalDissolvedSolids:
                                            reportCtrl.totalDissolvedSolids,
                                        totalSuspendedSolids:
                                            reportCtrl.totalSuspendedSolids,
                                        pH: reportCtrl.pH,
                                        turbidity: reportCtrl.turbidity,
                                        electricalConnection:
                                            reportCtrl.electricalConnection,
                                        dissolvedOxygen:
                                            reportCtrl.dissolvedOxygen,
                                        totalOrganicCarbon:
                                            reportCtrl.totalOrganicCarbon,
                                        volatileOrganicMatter:
                                            reportCtrl.volatileOrganicMatter,
                                        ozone: reportCtrl.ozone,
                                        allKindsOfCarbon:
                                            reportCtrl.allKindsOfCarbon,
                                        nitrogenDioxide:
                                            reportCtrl.nitrogenDioxide,
                                        sulfurDioxide: reportCtrl.sulfurDioxide,
                                        pM25: reportCtrl.pM25,
                                        pM10: reportCtrl.pM10,
                                      );
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: MediaSize.m50,
                                    color: ColorManager.primary,
                                    child: submitCtrl.loading.value == false
                                        ? const BubbleLoader()
                                        : Text(
                                            'Confirm Adding Report'.tr,
                                            style: getLightStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s18),
                                            textAlign: TextAlign.center,
                                          ),
                                  ),
                                );
                              });
                        })
                  ],
                ));
          }),
    ));
  }
}
