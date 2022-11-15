import 'dart:developer';

import 'package:enivronment/data/controller/location/governorate_controller.dart';
import 'package:enivronment/data/controller/location/region_controller.dart';
import 'package:enivronment/domain/model/epicenter/all-epicenter-model.dart';
import 'package:enivronment/presentation/report/widget/governorate_widget.dart';
import 'package:enivronment/presentation/report/widget/region_widget.dart';
import 'package:enivronment/presentation/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../app/app_prefs.dart';
import '../../app/shared_widgets/loader_widget.dart';
import '../../data/controller/epicenter/all_epicenter_controller.dart';
import '../../data/controller/pagination_controller.dart';
import '../epicenter/add_epicenter_screen.dart';
import '../login/login_screen.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widget/language_widget.dart';
import 'widget/list_item_widget.dart';
import 'widget/nearst_epicenters_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<Tab> tabs = <Tab>[
    Tab(text: 'all'.tr),
    Tab(text: 'nearst'.tr),
  ];

  // String dropdownvalue = 'Item 1';
  //
  // // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  int cityId = 0;

  AllEpicenterController epicenterCtrl = Get.find<AllEpicenterController>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: Container(
                  margin: const EdgeInsets.all(AppMargin.m8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(ImageAssets.splashLogo),
                  )),
                ),
                actions: [
                  //! change Language
                  InkWell(
                    onTap: () {
                      Get.to(() => const LanguageScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: AppMargin.m16, horizontal: AppMargin.m8),
                      width: SizeConfig.screenWidth! / MediaSize.m6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(BorderRadiusValues.br5),
                          border: Border.all(
                              width: AppSize.s1,
                              color: ColorManager.secondary)),
                      child: Text(
                        'language'.tr,
                        style: getSemiBoldStyle(color: ColorManager.secondary),
                      ),
                    ),
                  ),
                  //! Add Epicenter
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: ColorManager.secondary,
                    ),
                    onPressed: () {
                      Get.to(() => AddEpicenterScreen());
                    },
                  ),

                  //!logout
                  IconButton(
                    icon: Image.asset(
                      ImageAssets.logout,
                      width: SizeConfig.screenWidth! / MediaSize.m17,
                      height: SizeConfig.screenHeight! / MediaSize.m17,
                    ),
                    onPressed: () {
                      SharedPreferencesHelper.clearToken();
                      Get.offAll(const LoginScreen());
                    },
                  ),
                ],
                backgroundColor: ColorManager.white,
                bottom: TabBar(
                  labelColor: ColorManager.secondary,
                  labelStyle: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s16),
                  indicatorColor: ColorManager.secondary,
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return ColorManager.lightGrey;
                    }
                    return null;
                  }),
                  tabs: tabs,
                ),
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //   child: DecoratedBox(
                      //     decoration: BoxDecoration(
                      //         gradient: LinearGradient(
                      //             colors: [
                      //               ColorManager.lightPrimary,
                      //               ColorManager.primary,
                      //
                      //               // Colors.purpleAccent
                      //               //add more colors
                      //             ]),
                      //         borderRadius: BorderRadius.circular(BorderRadiusValues.br5),
                      //         boxShadow: <BoxShadow>[
                      //           BoxShadow(
                      //               color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                      //               blurRadius: BorderRadiusValues.br5) //blur radius of shadow
                      //         ]
                      //     ),
                      //     child: Padding(
                      //       padding: EdgeInsets.only(left:AppSize.s30, right:AppSize.s30),
                      //       child: DropdownButton(
                      //
                      //         // Initial Value
                      //         value: dropdownvalue,
                      //
                      //         // Down Arrow Icon
                      //         icon: const Icon(Icons.keyboard_arrow_down),
                      //
                      //         // Array list of items
                      //         items: items.map((String items) {
                      //           return DropdownMenuItem(
                      //             value: items,
                      //             child: Text(items),
                      //           );
                      //         }).toList(),
                      //         // After selecting the desired option,it will
                      //         // change button value to selected value
                      //         onChanged: (String? newValue) {
                      //           // setState(() {
                      //           //   dropdownvalue = newValue!;
                      //           // });
                      //         },
                      //         isExpanded: true, //make true to take width of parent widget
                      //         underline: Container(), //empty line
                      //         style: TextStyle(fontSize: 18, color: Colors.white),
                      //         dropdownColor: ColorManager.primary,
                      //         iconEnabledColor: Colors.black,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      GetX<RegionController>(
                          init: RegionController(),
                          builder: (regionClr) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  const RegionWidget(),
                                  if (regionClr.regionId.value != 0)
                                    GetBuilder<GovernorateController>(
                                        init: GovernorateController(
                                            regionClr.regionId.value),
                                        builder: (governoratCtrl) {
                                          return
                                              GovernorateWidget(
                                                  regionId: regionClr
                                                      .regionId.value);

                                        }),
                                ],
                              ),
                            );
                          }),
                      Expanded(
                          child: Obx(
                        () => Container(
                            padding: const EdgeInsets.only(
                                bottom: AppPadding.p8,
                                top: AppPadding.p20,
                                right: AppPadding.p14,
                                left: AppPadding.p14),
                            width: double.infinity,
                            color: ColorManager.lightGrey,
                            child: epicenterCtrl.loading.value == true
                                ? const LoaderWidget()
                                : epicenterCtrl.allEpicenter.isEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(
                                            AppPadding.p24),
                                        child:
                                            Image.asset(ImageAssets.emptyList),
                                      )
                                    :
                                          ListView.builder(
                                              itemCount: epicenterCtrl
                                                  .allEpicenter.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return ListItemWidget(
                                                  city: epicenterCtrl
                                                      .allEpicenter[index]
                                                      .city
                                                      .name,
                                                  governorate: epicenterCtrl
                                                      .allEpicenter[index]
                                                      .city
                                                      .governorate
                                                      .name,
                                                  images: epicenterCtrl
                                                      .allEpicenter[index]
                                                      .epicenterPhotos,
                                                  title: epicenterCtrl
                                                      .allEpicenter[index]
                                                      .description,
                                                  description: epicenterCtrl
                                                      .allEpicenter[index]
                                                      .reason??'',
                                                  date: epicenterCtrl
                                                      .allEpicenter[index]
                                                      .creationDate,
                                                  size: epicenterCtrl
                                                      .allEpicenter[index].size,
                                                  epicenterId: epicenterCtrl
                                                      .allEpicenter[index].id,
                                                  lat: epicenterCtrl
                                                      .allEpicenter[index].lat,
                                                  long: epicenterCtrl
                                                      .allEpicenter[index].long,
                                                );
                                              }),

                                      ),
                      )),
                      GetBuilder<PaginationController>(
                          init: PaginationController(),
                          builder: (paginationCtrl) {
                            return GetX<AllEpicenterController>(
                                init: AllEpicenterController(),
                                builder: (ctx) {
                                  var totalItemCount = int.parse(ctx.totalItem.value);
                                  var total = totalItemCount /10 ;
                                  return Align(
                                    alignment:
                                    Alignment.bottomCenter,
                                    child: NumberPagination(

                                      onPageChanged:
                                          (int pageNumber) {

                                        log("page number $pageNumber");
                                         // ctx.getAllEpicenter(pageNumber);
                                        ctx.changPageNum(pageNumber);

                                      },
                                      fontSize: FontSize.s12,
                                      iconNext: Icon(
                                        paginationCtrl
                                            .paginationNext,
                                        color: ColorManager.white,
                                      ),
                                      // iconNext:IconButton(icon:
                                      //   Icon(
                                      //     paginationCtrl
                                      //         .paginationNext,
                                      //     color: ColorManager.white,
                                      //   ),onPressed:(){
                                      //
                                      //       } ,) ,
                                      iconPrevious: Icon(
                                        paginationCtrl
                                            .paginationPervious,
                                        color: ColorManager.white,
                                      ),
                                      pageTotal:total.ceil(),
                                      pageInit:
                                      1, // picked number when init page
                                      colorPrimary:
                                      ColorManager.lightGrey,
                                      colorSub:
                                      ColorManager.secondary,
                                      threshold: AppConstants
                                          .paginationNumber,
                                    ),
                                  );
                                }
                            );
                          })

                    ],
                  ),

                  NearstEpicentersWidget(),
                ],
              )),
        );
      }),
    );
  }
}
