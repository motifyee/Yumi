import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/features/registeration/maps/permission.dart';

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

class GMapInfo {
  GoogleMapController? controller;

  final void Function(GoogleMapController controller, GMapInfo)? onMapCreated;

  final void Function(LatLng coordinate, GMapInfo info)? onTap;
  final void Function(String address, GMapInfo info)? onAddressTap;
  final bool setMarkerOnTap;

  final void Function(LatLng coordinate, GMapInfo info)? onLongPress;
  final void Function(String address, GMapInfo info)? onAddressLongPress;
  final bool setMarkerOnLongPress;

  Set<Marker> markers = {};

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
    return tryV<Position>(() => Geolocator.getCurrentPosition());
  }

  animateCamera(
    LatLng? latLng, {
    bool retainZoomLevel = false,
    double zoom = 11,
  }) async {
    if (latLng == null) return;

    double zoom0 = zoom;
    if (retainZoomLevel) {
      zoom0 = await tryV(() => controller?.getZoomLevel() ?? zoom);
    }

    controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: zoom0)));
  }

  animateToCurrentPosition() async {
    animateCamera((await currentPosition)?.toLatLng());
  }

  myLocationMarker(LatLng position) {
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

class GMap extends StatefulWidget {
  final GMapInfo info;
  final Set<Marker> _markers = {};

  GMap({super.key, required this.info});

  @override
  State<GMap> createState() => _MapState();
}

class _MapState extends State<GMap> {
  void _onMapCreated(GoogleMapController controller) async {
    // this action incures fees to google maps
    widget.info.controller = controller;

    if (widget.info.animateToLocationOnLoad) {
      widget.info.animateToCurrentPosition();
    }

    if (widget.info.onMapCreated != null) {
      widget.info.onMapCreated!(controller, widget.info);
    }
  }

  // TODO Handle adding markers and moving em
  void _onTap(LatLng coordinate) async {
    if (widget.info.onTap != null) {
      widget.info.onTap!(coordinate, widget.info);
    }

    if (widget.info.setMarkerOnTap) {
      setState(() {
        widget._markers.add(widget.info.myLocationMarker(coordinate));
      });
    }

    if (widget.info.onAddressTap == null) return;

    // TODO add loading animation here
    // locationFromAddress
    var locations = await placemarkFromCoordinates(
      coordinate.latitude,
      coordinate.longitude,
    );

    if (locations.isEmpty) {
      widget.info.onAddressTap!("", widget.info);
      return;
    }

    var loc = locations[0];

    var address = '${loc.name}, ${loc.locality}, ${loc.country}';

    widget.info.onAddressTap!(address, widget.info);
  }

  void _onLongPress(LatLng coordinate) async {
    if (widget.info.onLongPress != null) {
      widget.info.onLongPress!(coordinate, widget.info);
    }

    if (widget.info.setMarkerOnLongPress) {
      setState(() {
        widget._markers.add(widget.info.myLocationMarker(coordinate));
      });
    }

    if (widget.info.onAddressLongPress == null) return;

    // TODO add loading animation here
    // locationFromAddress
    var locations = await placemarkFromCoordinates(
      coordinate.latitude,
      coordinate.longitude,
    );

    if (locations.isEmpty) {
      widget.info.onAddressLongPress!("", widget.info);
      return;
    }

    var loc = locations[0];

    var address = '${loc.name}, ${loc.locality}, ${loc.country}';

    widget.info.onAddressLongPress!(address, widget.info);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: widget.info.initialCameraPosition,
        onMapCreated: _onMapCreated,
        onTap: _onTap,
        onLongPress: _onLongPress,
        tileOverlays: {
          const TileOverlay(
            tileOverlayId: TileOverlayId("value"),
          ),
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        markers: widget._markers);
  }

  @override
  void dispose() {
    super.dispose();
    widget.info.controller?.dispose();
  }
}
