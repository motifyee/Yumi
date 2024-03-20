import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/features/registeration/maps/model.dart';
import 'package:yumi/features/registeration/maps/permission.dart';

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
      widget.info.onAddressTap!(const Placemark(), coordinate, widget.info);
      return;
    }

    var loc = locations[0];

    widget.info.onAddressTap!(loc, coordinate, widget.info);
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
      widget.info.onAddressLongPress!(
          const Placemark(), coordinate, widget.info);
      return;
    }

    var loc = locations[0];

    widget.info.onAddressLongPress!(loc, coordinate, widget.info);
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
