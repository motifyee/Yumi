import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/app/components/google_map/util/extenstions.dart';
import 'package:yumi/app/components/google_map/util/geo_location_permission.dart';

class GMapInfo {
  GoogleMapController? controller;

  final void Function(GoogleMapController controller, GMapInfo)? onMapCreated;

  final void Function(LatLng coordinate, GMapInfo info)? onTap;
  final void Function(Placemark address, LatLng coord, GMapInfo info)?
      onAddressTap;
  final bool setMarkerOnTap;

  final void Function(LatLng coordinate, GMapInfo info)? onLongPress;
  final void Function(Placemark address, LatLng coord, GMapInfo info)?
      onAddressLongPress;
  final bool setMarkerOnLongPress;

  final Set<Marker> markers = const {};

  final LatLng? initialCameraLocation;
  final bool animateToLocationOnLoad;

  // TODO load from sever
  CameraPosition get initialCameraPosition {
    // if (initialCameraLocation == null) return null;
    // UK coordinates
    return const CameraPosition(
        target: LatLng(54.25841413102188, -2.0867961645126343), zoom: 6);
  }

  Future<Position?> get currentPosition async {
    return tryCall<Position>(() => Geolocator.getCurrentPosition());
  }

  Future<void> animateCamera(
    LatLng? latLng, {
    bool retainZoomLevel = false,
    double zoom = 11,
  }) async {
    if (latLng == null) return;

    double zoom0 = zoom;
    if (retainZoomLevel) {
      zoom0 = await tryCall(() => controller?.getZoomLevel() ?? zoom);
    }

    await controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: zoom0)));
  }

  Future<Location?> animateToAddress(String address) async {
    List<Location>? locations =
        await tryCall(() => locationFromAddress(address));

    if (locations == null) return null;

    var loc = locations[0];

    animateCamera(loc.toLatLng(), retainZoomLevel: true);

    return loc;
  }

  Future<void> animateToCurrentPosition() async {
    await animateCamera((await currentPosition)?.toLatLng());
  }

  Marker locationMarker(LatLng position) {
    return Marker(
        markerId: const MarkerId(
          'MyLocation',
        ),
        visible: true,
        position: position,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(
            title: 'My Location', snippet: 'Choose this location'));
  }

  GMapInfo({
    this.onMapCreated,
    this.onTap,
    this.onAddressTap,
    this.setMarkerOnTap = false,
    this.onLongPress,
    this.onAddressLongPress,
    this.setMarkerOnLongPress = false,
    this.initialCameraLocation,
    this.animateToLocationOnLoad = false,
  });
}
