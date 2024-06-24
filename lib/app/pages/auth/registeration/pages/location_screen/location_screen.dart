import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:yumi/app/components/google_map/util/geo_location_permission.dart';
import 'package:yumi/app/components/google_map/util/google_map_info.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/components/google_map/google_map_widget.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/snack_bar.dart';
import 'package:yumi/app/components/text_form_field.dart';

import '../../../../../components/google_map/util/extenstions.dart';

@RoutePage()
class LocationScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  late final GMapInfo mapInfo;
  // var selectedAddr = const Address();
  final bool isBack;

  Function({required Address address})? routeFn;

  // onAddressTap: (address) => print(address)
  // onMapCreated: (c) => controller = c,

  LocationScreen({super.key, this.routeFn, this.isBack = false});

  Future<Location?> _navToAddress(String address) async {
    List<Location>? locations = await tryV(() => locationFromAddress(address));

    if (locations == null) return null;

    var loc = locations[0];

    mapInfo.animateCamera(loc.toLatLng(), retainZoomLevel: true);

    return loc;
  }

  @override
  Widget build(BuildContext context) {
    var regCubit = context.read<RegCubit>();
    mapInfo = GMapInfo(
        setMarkerOnLongPress: true,
        onAddressLongPress: (placemark, coord, info) {
          regCubit.setLocation(
            regCubit.state.address.copyWith(
              location:
                  '${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}',
              latitude: coord.latitude,
              longitude: coord.longitude,
            ),
          );
        },
        onTap: (LatLng latLng, GMapInfo info) async {
          debugPrint((await info.controller?.getZoomLevel()).toString());
        });
    return PopScope(
      canPop: regCubit.state.partialFlow || isBack ? true : false,
      onPopInvoked: (didPop) {
        if (!regCubit.state.partialFlow) askToLogout(context, isBack: isBack);
      },
      child: Scaffold(
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

  final TextEditingController controller = TextEditingController();

  Widget locationBar() {
    return BlocSelector<RegCubit, RegState, Address>(
      selector: (state) => state.address,
      builder: (context, state) {
        getLocation() {
          debugPrint('clicks');
          geo(() async {
            await Geolocator.getCurrentPosition().then((loc) async {
              mapInfo.animateCamera(
                LatLng(loc.latitude, loc.longitude),
                zoom: 11,
              );
              // mapInfo.controller?.animateCamera(CameraUpdate.newLatLngZoom(
              //     LatLng(loc.latitude, loc.longitude), 11));

              await tryV(() => placemarkFromCoordinates(
                    loc.latitude,
                    loc.longitude,
                  )).then((placemarks) {
                var placemark = placemarks[0];

                context.read<RegCubit>().setLocation(
                      state.copyWith(
                        location:
                            '${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}',
                        latitude: loc.latitude,
                        longitude: loc.longitude,
                      ),
                    );
              });
            });
          }, true, context);
        }

        () async {
          void getSuggestion(String input) async {
            String kplacesApiKey = "CHANGE THIS WITH YOUR GOOGLE API KEY";
            String baseURL =
                'https://maps.googleapis.com/maps/api/place/autocomplete/json';
            String request = '$baseURL?input=$input&key=$kplacesApiKey';

            var response = await DioClient.simpleDio().get(request);
            debugPrint(response.toString());
          }
        }();
        return Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Card(
            elevation: 5,
            child: SizedBox(
              height: 50,
              child: Stack(
                children: [
                  GooglePlaceAutoCompleteTextField(
                    textEditingController: controller,
                    googleAPIKey: "AIzaSyBlhKSqJ_5FgfUS3tnGmjV6hxPocuFBB_Y",
                    // googleAPIKey: "AIzaSyCT36qFZg_DTHBU0fdTWdooUtixPJw3TUA",
                    boxDecoration: const BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.transparent),
                      color: Colors.transparent,
                    ),
                    inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                    ),

                    debounceTime: 800,
                    countries: const ["uk", "ie"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) async {
                      final double lat =
                          double.tryParse(prediction.lat ?? '') ?? 0;
                      final double lng =
                          double.tryParse(prediction.lng ?? '') ?? 0;

                      mapInfo.animateCamera(LatLng(lat, lng), zoom: 11);

                      if (lat == 0 ||
                          lng == 0 ||
                          prediction.description == null) {
                        return G.snackBar("Try to pin an exact location!");
                      }

                      debugPrint("placeDetails${prediction.lng}");

                      context.read<RegCubit>().setLocation(
                            state.copyWith(
                              location: prediction.description!,
                              latitude: lat,
                              longitude: lng,
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
    return BlocListener<RegCubit, RegState>(
      listener: (context, state) {
        if (state.addressStatus == Status.error) {
          ScaffoldMessenger.of(G.cContext).showSnackBar(
            SnackBar(
              content: SnackBarMassage(
                massage: state.addressMessage,
                // massage: "Error updating location",
              ),
            ),
          );
        }
      },
      child: BlocSelector<RegCubit, RegState, Address>(
        selector: (RegState state) {
          return state.address;
        },
        // listener: (context, state) { },
        builder: (context, addressState) {
          if (addressState.latitude == null) return const SizedBox();

          return Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Card(
                elevation: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: addressForm(addressState, context),
                ),
              ));
        },
      ),
    );
  }

  final inputKey1 = UniqueKey();
  final inputKey2 = UniqueKey();
  Widget? addressForm(Address addressState, BuildContext context) {
    Address address = addressState.copyWith();
    bool validate() {
      if (!(formKey.currentState?.validate() ?? false)) return false;

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
          address.latitude == null || address.longitude == null,
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

    void moveCameraToManualAddress() async {
      formKey.currentState!.save();

      await tryV(
        () => _navToAddress(address.location ?? ''),
      ).then((value) {
        if (value != null) {
          context.read<RegCubit>().setLocation(
                address.copyWith(
                  latitude: value.latitude,
                  longitude: value.longitude,
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
          SizedBox(
            // height: 50,
            child: TextFormFieldTemplate(
              initialValue: address.addressTitle,
              key: inputKey1,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              onSave: (value) {
                address = address.copyWith(addressTitle: value);
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
            initialValue: address.addressDetails,
            key: inputKey2,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            onSave: (value) {
              address = address.copyWith(addressDetails: value);
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
                child: Text(address.location ?? ''),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InteractiveButton(
            label: 'Ok',
            onPressed: () async {
              formKey.currentState!.save();
              if (!validate()) return;

              context.read<RegCubit>().setLocation(address);
              await context.read<RegCubit>().saveLocation(routeFn: routeFn);
            },
          ),
        ],
      ),
    );
  }
}