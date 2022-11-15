import 'package:get/get.dart';
import 'package:location/location.dart';

class CurrentLocationController extends GetxController {
  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  final Location location = Location();

  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  double? _lat;
  double? _long;

 double get currentLat => _lat??0.0;

double  get currentLong => _long??0.0;
  getLocation() async {
    if (permissionGranted == null || locationData == null) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      location.getLocation().then((currentLocation) {
        _lat = currentLocation.latitude;
        _long = currentLocation.longitude;
        update();
      });
    }
  }
}
