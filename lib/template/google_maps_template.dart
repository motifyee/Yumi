import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsTemplate extends StatefulWidget {
  GoogleMapsTemplate({super.key, required this.loadingChild});

  Widget loadingChild;
  final List<Marker> _markers = <Marker>[];

  @override
  State<GoogleMapsTemplate> createState() => GoogleMapsTemplateState();
}

class GoogleMapsTemplateState extends State<GoogleMapsTemplate> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static CameraPosition? _kGooglePlex;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    getUserCurrentLocation().then((value) {
      print(value);
      Geolocator.getCurrentPosition().then((currLocation) async {
        setState(() {
          _kGooglePlex = CameraPosition(
            target: LatLng(currLocation.latitude, currLocation.longitude),
            zoom: 16,
          );
          widget._markers.add(Marker(
              markerId: MarkerId('1'),
              position: LatLng(currLocation.latitude, currLocation.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(8),
              infoWindow: InfoWindow(
                title: 'My Position',
              )));
        });

        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex!));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _kGooglePlex == null
          ? widget.loadingChild
          : GoogleMap(
              mapType: MapType.normal,
              markers: Set<Marker>.of(widget._markers),
              initialCameraPosition: _kGooglePlex!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
