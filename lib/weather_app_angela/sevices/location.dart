import 'package:geolocator/geolocator.dart';

class Location {
  late final double latitude;
  late final double longitude;

 // Location({ required this.latitude, required this.longitude});

  Future<void> getCurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;

      print("position: ${position}");
    } catch (e) {
      print(e);
    }
  }
}
