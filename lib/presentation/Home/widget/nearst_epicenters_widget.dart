import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/current_location_controller.dart';
import '../../../app/shared_widgets/loader_widget.dart';
import '../../../data/controller/epicenter/nearst_epicenters_controller.dart';
import '../../epicenter/widgets/epicenter_radio_widget.dart';
import '../../report/widget/report_divider_widget.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

// ignore: must_be_immutable
class NearstEpicentersWidget extends StatelessWidget {
  NearstEpicentersWidget({Key? key}) : super(key: key);
  CurrentLocationController location = Get.find<CurrentLocationController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<NearstEpicenterController>(
        init: NearstEpicenterController(
            location.currentLat, location.currentLong),
        builder: (nearstEpicenterCtrl) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.lightGrey,
                ),
                child: NearstEpicenterRadioWidget(
                  enumName: NearstEpicenterRadio,
                  allValue: NearstEpicenterRadio.all,
                  onChangedAll: (val) => nearstEpicenterCtrl
                      .onRadioChange(val ?? NearstEpicenterRadio.all),
                  notVisitedValue: NearstEpicenterRadio.notVisited,
                  onChangedNotVisited: (val) => nearstEpicenterCtrl
                      .onRadioChange(val ?? NearstEpicenterRadio.notVisited),
                  visitedValue: NearstEpicenterRadio.visited,
                  onChangedVisited: (val) => nearstEpicenterCtrl
                      .onRadioChange(val ?? NearstEpicenterRadio.visited),
                  groupValue: nearstEpicenterCtrl.charcter,
                ),
              ),
              //? divider
              const ReportDividerWidget(),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(
                        bottom: AppPadding.p8,
                        top: AppPadding.p20,
                        right: AppPadding.p14,
                        left: AppPadding.p14),
                    width: double.infinity,
                    color: ColorManager.lightGrey,
                    child: nearstEpicenterCtrl.loading.value == true
                        ? const LoaderWidget()
                        : nearstEpicenterCtrl.markers == <Marker>{}
                            ? Padding(
                                padding: const EdgeInsets.all(AppPadding.p24),
                                child: Image.asset(ImageAssets.emptyLocation),
                              )
                            : GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(location.currentLat,
                                      location.currentLong),
                                  zoom: 14.4746,
                                ),
                                mapType: MapType.satellite,
                                markers: nearstEpicenterCtrl.markers,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                onMapCreated:
                                    (GoogleMapController controller) {},
                              )),
              ),
            ],
          );
        });
  }
}
