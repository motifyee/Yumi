import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/features/registeration/maps/google_maps.dart';
import 'package:yumi/features/registeration/maps/permission.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/repository/mock.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class LocationScreen extends StatelessWidget {
  TextEditingController addController = TextEditingController();

  late GMapInfo mapInfo;

  // onAddressTap: (address) => print(address)
  // onMapCreated: (c) => controller = c,

  LocationScreen({super.key});

  Future<Location?> _navToAddress(String address) async {
    List<Location>? locations = await tryV(() => locationFromAddress(address));

    if (locations == null) return null;

    var loc = locations[0];

    mapInfo.animateCamera(loc.toLatLng(), retainZoomLevel: true);
    // mapInfo.controller?.animateCamera(
    //     CameraUpdate.newLatLngZoom(LatLng(loc.latitude, loc.longitude), zoom));

    return loc;
  }

  void _getLocation() {
    geo(() async {
      var loc = await Geolocator.getCurrentPosition();

      mapInfo.controller?.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(loc.latitude, loc.longitude), 11));

      List<Placemark> placemarks = await tryV(() => placemarkFromCoordinates(
            loc.latitude,
            loc.longitude,
          ));

      var placemark = placemarks[0];
      var address =
          "${placemark.name}, ${placemark.locality}, ${placemark.country}";

      // var add = await locationFromAddress(address);

      addController.text = address;
      // print('\n');
      // print(add);
      // print('\n');
      // print(loc.latitude);
      // print(loc.longitude);
    }, true);
  }

  @override
  Widget build(BuildContext context) {
    mapInfo = GMapInfo(
        setMarkerOnLongPress: true,
        onAddressLongPress: (address, info) {
          addController.text = address;
        },
        onTap: (LatLng latLng, GMapInfo info) async {
          print(await info.controller?.getZoomLevel());
        });

    return BlocProvider(
      create: (context) => ScheduleBloc(scheduleRepo: ScheduleMockRepo()),
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
            title: Center(
              child: Text(
                "Pick your location",
                style: TextStyle(fontSize: ThemeSelector.fonts.font_16),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(child: GMap(info: mapInfo)),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: _getLocation,
                      child: const Text('Get You Current Location'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: addController,
                              onChanged: (value) {
                                // addressInput = value;
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter your address"),
                            ),
                          ),
                          TextButton(
                            // TODO don't use placemark api if coordinates were already choosen
                            onPressed: () => _navToAddress(addController.text),
                            child: const Text('Navigate'),
                          ),
                          TextButton(
                            onPressed: () => _navToAddress(addController.text),
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
