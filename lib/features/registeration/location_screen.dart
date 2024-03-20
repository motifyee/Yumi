import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/features/registeration/maps/google_maps.dart';
import 'package:yumi/features/registeration/maps/permission.dart';
import 'package:yumi/features/registeration/model/address.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/snack_bar.dart';

import './maps/extenstions.dart';
import './maps/model.dart';

@RoutePage()
class LocationScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  late GMapInfo mapInfo;
  var selectedAddr = const Address();

  Function({required Address address})? routeFn;

  // onAddressTap: (address) => print(address)
  // onMapCreated: (c) => controller = c,

  LocationScreen({super.key, this.routeFn});

  Future<Location?> _navToAddress(String address) async {
    List<Location>? locations = await tryV(() => locationFromAddress(address));

    if (locations == null) return null;

    var loc = locations[0];

    mapInfo.animateCamera(loc.toLatLng(), retainZoomLevel: true);
    // mapInfo.controller?.animateCamera(
    //     CameraUpdate.newLatLngZoom(LatLng(loc.latitude, loc.longitude), zoom));

    return loc;
  }

  @override
  Widget build(BuildContext context) {
    var regBloc = context.read<RegBloc>();

    mapInfo = GMapInfo(
        setMarkerOnLongPress: true,
        onAddressLongPress: (address, coord, info) {
          regBloc.add(
            RegEvent.updateLocation(
              regBloc.state.address.copyWith(
                country: address.country,
                city: address.locality,
                street: address.street,
                latitude: coord.latitude,
                longitude: coord.longitude,
              ),
            ),
          );
        },
        onTap: (LatLng latLng, GMapInfo info) async {
          print(await info.controller?.getZoomLevel());
        });

    getLocation() {
      geo(() async {
        var loc = await Geolocator.getCurrentPosition();

        mapInfo.controller?.animateCamera(CameraUpdate.newLatLngZoom(
            LatLng(loc.latitude, loc.longitude), 11));

        List<Placemark> placemarks = await tryV(() => placemarkFromCoordinates(
              loc.latitude,
              loc.longitude,
            ));

        var placemark = placemarks[0];

        regBloc.add(RegEvent.updateLocation(regBloc.state.address.copyWith(
          country: placemark.country,
          city: placemark.locality,
          street: placemark.street,
          latitude: loc.latitude,
          longitude: loc.longitude,
        )));
      }, true);
    }

    return BlocConsumer<RegBloc, RegState>(
      listener: (context, state) {
        if (state.addressStatus == BlocStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: SnackBarMassage(
                massage: "Error updating location",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return ScreenContainer(
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
                        onPressed: getLocation,
                        child: const Text('Get You Current Location'),
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: state.address.country,
                                      key: UniqueKey(),
                                      onSaved: (value) {
                                        context.read<RegBloc>().add(
                                              RegEvent.updateLocation(
                                                state.address.copyWith(
                                                  country: value,
                                                ),
                                              ),
                                            );
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Country"),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: state.address.city,
                                      key: UniqueKey(),
                                      onSaved: (value) {
                                        context.read<RegBloc>().add(
                                              RegEvent.updateLocation(
                                                state.address.copyWith(
                                                  city: value,
                                                ),
                                              ),
                                            );
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "city"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: state.address.street,
                                      key: UniqueKey(),
                                      onSaved: (value) {
                                        context.read<RegBloc>().add(
                                              RegEvent.updateLocation(
                                                state.address.copyWith(
                                                  street: value,
                                                ),
                                              ),
                                            );
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Enter your address"),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        formKey.currentState!.save();

                                        await tryV(
                                          () => _navToAddress(
                                              state.address.fullAddress),
                                        ).then((value) {
                                          if (value != null) {
                                            context.read<RegBloc>().add(
                                                  RegEvent.updateLocation(
                                                    state.address.copyWith(
                                                      latitude: value.latitude,
                                                      longitude:
                                                          value.longitude,
                                                    ),
                                                  ),
                                                );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: SnackBarMassage(
                                                  massage:
                                                      "Please enter a valid address",
                                                ),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/images/map/map_pin.svg')),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    if (state.address.fullAddress.isEmpty ||
                                        (state.address.city?.isEmpty ??
                                            false) ||
                                        (state.address.street?.isEmpty ??
                                            false)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: SnackBarMassage(
                                            massage:
                                                "Please enter a valid address",
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    if (state.address.latitude == null ||
                                        state.address.longitude == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: SnackBarMassage(
                                            massage:
                                                "Please interact with the map to specify your exact location",
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    context.read<RegBloc>().add(
                                        RegEvent.saveLocation(context,
                                            routeFn: routeFn));
                                  },
                                  child: const Text('Ok'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
