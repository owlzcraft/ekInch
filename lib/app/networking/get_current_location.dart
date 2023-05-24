// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:geolocator/geolocator.dart';

getCurrentLocation() async {
  var location = await Geolocator.getCurrentPosition();

  return {"latitude": location.latitude, "longitude": location.longitude};
}

class Location {
  late final latitude;
  late final longitude;
  Location({required this.latitude, required this.longitude});
}
