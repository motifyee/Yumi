import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/statics/geo_location.dart';

//TODO: must config google maps and geolocation for ios ...

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

  @override
  void initState() {
    super.initState();
    GeoLocation.getUserCurrentLocation().then((currLocation) async {
      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(currLocation.latitude, currLocation.longitude),
          zoom: 16,
        );
        widget._markers.add(
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(currLocation.latitude, currLocation.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(8),
            infoWindow: const InfoWindow(
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
