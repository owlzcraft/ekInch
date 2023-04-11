import 'package:geolocator/geolocator.dart';

getCurrentLocation() async {
  var location = await Geolocator.getCurrentPosition();
  print(location.latitude);
  print(location.longitude);
  return {"latitude": location.latitude, "longitude": location.longitude};
}

class Location {
  late final latitude;
  late final longitude;
  Location({required this.latitude, required this.longitude});
}
