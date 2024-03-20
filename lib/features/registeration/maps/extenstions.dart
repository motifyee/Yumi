import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PositionX on Position {
  toLatLng() {
    return LatLng(latitude, longitude);
  }
}

extension LocationX on Location {
  toLatLng() {
    return LatLng(latitude, longitude);
  }
}
