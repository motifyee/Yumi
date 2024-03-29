import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/features/registeration/maps/google_maps.dart';
import 'package:yumi/features/registeration/maps/permission.dart';
import 'package:yumi/features/registeration/model/address.dart';
import 'package:yumi/forms/util/form_submit.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';

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
        onAddressLongPress: (placemark, coord, info) {
          regBloc.add(
            RegEvent.updateLocation(
              regBloc.state.address.copyWith(
                // addressDetails: address.country,
                // addresssTitle: address.locality,
                location:
                    '${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}',
                latitude: coord.latitude,
                longitude: coord.longitude,
              ),
            ),
          );
        },
        onTap: (LatLng latLng, GMapInfo info) async {
          print(await info.controller?.getZoomLevel());
        });

    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   bottomOpacity: 0,
        //   scrolledUnderElevation: 0,
        //   iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
        //   title: Center(
        //     child: Text(
        //       "Pick your location",
        //       style: TextStyle(fontSize: ThemeSelector.fonts.font_16),
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GMap(info: mapInfo),
            ),
            locationBar(),
            addressCard(),
          ],
        ),
      ),
    );
  }

  TextEditingController controller = TextEditingController();

  Widget locationBar() {
    return BlocBuilder<RegBloc, RegState>(
      builder: (context, state) {
        getLocation() {
          debugPrint('clicks');
          geo(() async {
            await Geolocator.getCurrentPosition().then((loc) async {
              mapInfo.controller?.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(loc.latitude, loc.longitude), 11));

              await tryV(() => placemarkFromCoordinates(
                    loc.latitude,
                    loc.longitude,
                  )).then((placemarks) {
                var placemark = placemarks[0];

                context
                    .read<RegBloc>()
                    .add(RegEvent.updateLocation(state.address.copyWith(
                      location:
                          '${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}',
                      latitude: loc.latitude,
                      longitude: loc.longitude,
                    )));
              });
            });
          }, true, context);
        }

        return Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Card(
            elevation: 5,
            child: SizedBox(
              height: 50,
              // padding: const EdgeInsets.only(left: 16),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GooglePlaceAutoCompleteTextField(
                    textEditingController: controller,
                    googleAPIKey: "AIzaSyCT36qFZg_DTHBU0fdTWdooUtixPJw3TUA",
                    // inputDecoration: const InputDecoration(),
                    boxDecoration: const BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.transparent),
                      color: Colors.transparent,
                    ),
                    inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                    ),

                    debounceTime: 800,
                    countries: const ["uk", "ir"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print("placeDetails${prediction.lng}");

                      context.read<RegBloc>().add(
                            RegEvent.updateLocation(
                              state.address.copyWith(
                                latitude: double.tryParse(prediction.lat ?? ''),
                                longitude:
                                    double.tryParse(prediction.lng ?? ''),
                              ),
                            ),
                          );
                    },
                    itemClick: (Prediction prediction) {
                      controller.text = prediction.description ?? '';
                      controller.selection = TextSelection.fromPosition(
                        TextPosition(
                            offset: prediction.description?.length ?? 0),
                      );
                    },
                    itemBuilder: (context, index, Prediction prediction) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(child: Text(prediction.description ?? ""))
                          ],
                        ),
                      );
                    },
                    seperatedBuilder: Divider(
                        color: ThemeSelector.colors.primary.withOpacity(.1)),
                    isCrossBtnShown: true,
                    containerHorizontalPadding: 50,
                  ),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 16,
                      child: Icon(Icons.search,
                          color: ThemeSelector.colors.primary)),
                  Positioned(
                    top: 5,
                    bottom: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: getLocation,
                      icon: SvgPicture.asset('assets/images/map/map_pin.svg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget addressCard() {
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
        if (state.address.latitude == null) return const SizedBox();

        return Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Card(
              elevation: 5,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: addressForm(state, context),
              ),
            ));
      },
    );
  }

  Widget? addressForm(RegState state, BuildContext context) {
    acceptAddress() {
      formKey.currentState!.save();

      // context.read<RegBloc>().add(RegEvent.saveLocation(context));
    }

    Address address = state.address;

    bool validate() {
      var values = [
        [
          address.location?.isEmpty ?? true,
          "Please choose a valid address",
        ],
        [
          address.addressDetails?.isEmpty ?? true,
          "Please enter your address details",
        ],
        [
          address.addressTitle?.isEmpty ?? true,
          "Please enter a title for your address",
        ],
        [
          address.latitude == null || state.address.longitude == null,
          "Please interact with the map to specify your exact location"
        ]
      ];
      var trueV = values.firstWhere((element) => element[0] as bool,
          orElse: () => [false]);

      if (!(trueV[0] as bool)) return true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackBarMassage(
            massage: trueV[1] as String,
          ),
        ),
      );
      return false;
    }

    var save = onFormFieldsSaved<Address>(
      formKey,
      onAllFieldsSaved: (reg, _) {
        if (!validate()) return;

        context.read<RegBloc>().add(RegEvent.updateLocation(address));
        context
            .read<RegBloc>()
            .add(RegEvent.saveLocation(context, routeFn: routeFn));
      },
    );
    moveCameraToManualAddress() async {
      formKey.currentState!.save();

      await tryV(
        () => _navToAddress(state.address.location ?? ''),
      ).then((value) {
        if (value != null) {
          context.read<RegBloc>().add(
                RegEvent.updateLocation(
                  state.address.copyWith(
                    latitude: value.latitude,
                    longitude: value.longitude,
                  ),
                ),
              );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: SnackBarMassage(
                massage: "Please enter a valid address",
              ),
            ),
          );
        }
      });
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          // Row( children: [ Expanded( child: TextFormFieldTemplate( initialValue: state.address.country, key: UniqueKey(), onSave: (value) { context.read<RegBloc>().add( RegEvent.updateLocation( state.address.copyWith( country: value,),),); }, label: "Country", hintText: "Country",),), // Expanded( child:), ],),
          SizedBox(
            // height: 50,
            child: TextFormFieldTemplate(
              initialValue: state.address.addressTitle,
              key: UniqueKey(),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              onSave: (value) {
                save(address = address.copyWith(addressTitle: value));
                // context.read<RegBloc>().add(
                //       RegEvent.updateLocation(
                //         state.address.copyWith(
                //           addresssTitle: value,
                //         ),
                //       ),
                //     );
              },
              validators: (val) => (val?.length ?? 0) < 3
                  ? 'Minimum 3 characters required'
                  : null,
              hintText: 'Address Title, eg: My Home Address',
              label: "Address Title",
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldTemplate(
            initialValue: state.address.addressDetails,
            key: UniqueKey(),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            onSave: (value) {
              save(address = address.copyWith(addressDetails: value));
              // context.read<RegBloc>().add(
              //       RegEvent.updateLocation(
              //         state.address.copyWith(
              //           addressDetails: value,
              //         ),
              //       ),
              //     );
            },
            validators: (val) =>
                (val?.length ?? 0) < 8 ? 'Minimum 8 characters required' : null,
            hintText: 'Address Details, eg: House No., Building Name, etc',
            label: 'Adddress Details',
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset('assets/images/map/map_pin.svg'),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(state.address.location ?? ''),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ConfirmButton(
            label: 'Ok',
            onPressed: acceptAddress,
          ),
        ],
      ),
    );
  }
}
