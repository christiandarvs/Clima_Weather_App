import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  Position? position;
  Future<void> getLoc() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    latitude = position!.latitude;
    longitude = position!.longitude;
  }
}
