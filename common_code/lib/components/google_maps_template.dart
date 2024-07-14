import 'dart:async';

import 'package:common_code/domain/address/entity/address.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//TODO: must config google maps and geolocation for ios ...

class GoogleMapsTemplate extends StatefulWidget {
  GoogleMapsTemplate({super.key, required this.loadingChild, this.target});

  Widget loadingChild;
  final List<Marker> _markers = <Marker>[];
  final Address? target;

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
    if (widget.target == null) {
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
    } else {
      _kGooglePlex = CameraPosition(
        target: LatLng(widget.target!.latitude!, widget.target!.longitude!),
        zoom: 16,
      );
      widget._markers.add(
        Marker(
          markerId: MarkerId('${widget._markers.length}'),
          position: LatLng(widget.target!.latitude!, widget.target!.longitude!),
          icon: BitmapDescriptor.defaultMarkerWithHue(8),
          infoWindow: const InfoWindow(
            title: '',
          ),
        ),
      );
    }
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

class GeoLocation {
  static Future<Position> getUserCurrentLocation() async {
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
}
