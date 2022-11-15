import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_image/shimmer_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/constants.dart';
import '../../../domain/model/epicenter/epicenter_model.dart';
import '../../report/add_report_screen.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(
      {Key? key,
      required this.images,
      required this.title,
      required this.description,
      required this.date,
      required this.size,
      required this.epicenterId,
      required this.lat,
      required this.long,
      required this.city,
      required this.governorate})
      : super(key: key);
  final List<PhotoModel> images;
  final String title;
  final String description;
  final String date;
  final double size;
  final double lat;
  final double long;
  final String city;
  final String governorate;
  final int epicenterId;
  Future<void> openMap(double lat, double long) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    if (await canLaunchUrl(Uri.parse(googleMapUrl))) {
      await launchUrl(Uri.parse(googleMapUrl));
    } else {
      throw 'could not open map';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => AddReportScreen(
                  epicenterId: epicenterId,
                ));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p8, horizontal: AppPadding.p8),
            width: double.infinity,
            height: SizeConfig.screenHeight! / MediaSize.m5,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(
                    width: AppSize.s1,
                    color:
                        ColorManager.secondary.withOpacity(OpicityValue.o2))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SizedBox(
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m4,
                                  child: CarouselSlider.builder(
                                      itemCount: images.length,
                                      itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) {
                                        return ProgressiveImage(
                                          width: 300.0,
                                          image: Constants.epicenterPhotoUrl +
                                              images[itemIndex].photo,
                                          height: 200.0,
                                        );
                                      },
                                      options: CarouselOptions(
                                        aspectRatio: CarouselOptionsValues
                                                .aspectRatioFirstValue /
                                            CarouselOptionsValues
                                                .aspectRatioSecondValue,
                                        viewportFraction: CarouselOptionsValues
                                            .viewportFraction,
                                        initialPage:
                                            CarouselOptionsValues.initialPage,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval: const Duration(
                                            seconds: TimeManager.ts3),
                                        autoPlayAnimationDuration:
                                            const Duration(
                                                seconds: TimeManager.ts1),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.horizontal,
                                      )),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: SizeConfig.screenWidth! / MediaSize.m3_8,
                        height: SizeConfig.screenHeight! / MediaSize.m8,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(ImageAssets.multiImage),
                        )),
                      ),
                    ),
                    SizedBox(
                        width: SizeConfig.screenWidth! / MediaSize.m1_7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //! title
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: getBoldStyle(
                                  color: ColorManager.secondary,
                                  fontSize: FontSize.s16),
                            ),
                            //! description
                            Text(
                              description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: MaxLineValues.max3,
                              style: getSemiBoldStyle(
                                color: ColorManager.secondary,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                //! Location ,Size and Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //!location
                    InkWell(
                      onTap: () async {
                        await openMap(lat, long);
                      },
                      child: Container(
                        height: SizeConfig.screenHeight! / MediaSize.m30,
                        width: SizeConfig.screenWidth! / MediaSize.m3_5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s4),
                          color: ColorManager.primary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: FontSize.s16,
                              color: ColorManager.white,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! / MediaSize.m4_5,
                              child: Text(
                                "$city , $governorate",
                                overflow: TextOverflow.ellipsis,
                                style: getLightStyle(color: ColorManager.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //!size
                    SizedBox(
                      width: SizeConfig.screenWidth! / MediaSize.m5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fullscreen,
                            size: FontSize.s16,
                            color: ColorManager.secondary,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! / MediaSize.m7_5,
                            child: Text(
                              "$size ${" meter".tr}",
                              overflow: TextOverflow.ellipsis,
                              style:
                                  getLightStyle(color: ColorManager.secondary),
                            ),
                          )
                        ],
                      ),
                    ),
                    //!date
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SizedBox(
                                  height:
                                      SizeConfig.screenHeight! / MediaSize.m12,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: ColorManager.secondary,
                                      ),
                                      Text(
                                        "${DateTime.tryParse(date)}"
                                            .substring(0, 16),
                                        style: getBoldStyle(
                                            color: ColorManager.secondary),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: SizeConfig.screenWidth! / MediaSize.m3,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: FontSize.s16,
                              color: ColorManager.secondary,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! / MediaSize.m3_5,
                              child: Text(
                                "${DateTime.tryParse(date)}".substring(0, 16),
                                overflow: TextOverflow.ellipsis,
                                style: getLightStyle(
                                    color: ColorManager.secondary),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        //! divider
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
          child: Divider(
            thickness: AppSize.s1,
            color: ColorManager.grey1.withOpacity(OpicityValue.o3),
          ),
        )
      ],
    );
  }
}
