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
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    getUserCurrentLocation().then((currLocation) async {
      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(currLocation.latitude, currLocation.longitude),
          zoom: 16,
        );
        widget._markers.add(
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(currLocation.latitude, currLocation.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(8),
            infoWindow: InfoWindow(
              title: 'My Position',
            ),
          ),
        );
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
