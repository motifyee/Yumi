import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/statics/geo_location.dart';

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
