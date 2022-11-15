import 'dart:async';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddEpicenterMapCtrl extends GetxController {
  Completer<GoogleMapController> compeleteController = Completer();

  Marker mark = const Marker(
    markerId: MarkerId("0"),
  );
bool isClicked =false;

  Future<void> animateCamera(LocationData location) async {
    final GoogleMapController controller = await compeleteController.future;
    CameraPosition cameraPostion = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(
          location.latitude!,
          location.longitude!,
        ),
        zoom: 16.4746);

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPostion));
  }

  double calculateDistance(lat1, long1, lat2, long2) {
    var d1 = lat1 * (math.pi / 180.0);
    var num1 = long1 * (math.pi / 180.0);
    var d2 = lat2 * (math.pi / 180.0);
    var num2 = long2 * (math.pi / 180.0) - num1;
    var d3 = math.pow(math.sin((d2 - d1) / 2.0), 2.0) +
        math.cos(d1) * math.cos(d2) * math.pow(math.sin(num2 / 2.0), 2.0);
    return 6376500.0 * (2.0 * math.atan2(math.sqrt(d3), math.sqrt(1.0 - d3)));
  }

  void setMarker(LatLng location) {
    Marker newMarker = Marker(
        markerId: MarkerId(location.toString()),
        icon: BitmapDescriptor.defaultMarker,
        position: location,
        onTap: () {});
    mark = newMarker;
    update();
  }

void clicked (){
  isClicked= true;
  update();
}

}
