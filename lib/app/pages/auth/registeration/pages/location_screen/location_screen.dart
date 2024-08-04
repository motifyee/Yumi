import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

@RoutePage()
class LocationScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final addressTitleKey = UniqueKey();
  final addressDetailsKey = UniqueKey();

  final GMapInfo mapInfo = GMapInfo(
      setMarkerOnLongPress: true,
      onAddressLongPress: (placemark, coord, info) {
        final regCubit = G().rd<RegCubit>();
        regCubit.setLocation(
          regCubit.state.address.copyWith(
            location: '${placemark.subAdministrativeArea}, '
                '${placemark.administrativeArea}, '
                '${placemark.country}',
            latitude: coord.latitude,
            longitude: coord.longitude,
          ),
        );
      },
      onTap: (LatLng latLng, GMapInfo info) async {
        debugPrint((await info.controller?.getZoomLevel()).toString());
      });

  final bool isBack;
  final Function({required Address address})? routeFn;

  LocationScreen({super.key, this.routeFn, this.isBack = false});

  @override
  Widget build(BuildContext context) {
    final regCubit = G().rd<RegCubit>();

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
            buildLocationBar(),
            buildAddressCard(),
          ],
        ),
      ),
    );
  }

  final TextEditingController autoCompleteController = TextEditingController();

  Widget buildLocationBar() {
    return BlocSelector<RegCubit, RegState, Address>(
      selector: (state) => state.address,
      builder: (context, state) {
        final placesAutocompleteField = GooglePlaceAutoCompleteTextField(
          textEditingController: autoCompleteController,
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
            final double lat = double.tryParse(prediction.lat ?? '') ?? 0;
            final double lng = double.tryParse(prediction.lng ?? '') ?? 0;

            mapInfo.animateCamera(LatLng(lat, lng), zoom: 11);

            if (lat == 0 || lng == 0 || prediction.description == null) {
              return G().snackBar("Try to pin an exact location!");
            }

            context.read<RegCubit>().setLocation(
                  state.copyWith(
                    location: prediction.description!,
                    latitude: lat,
                    longitude: lng,
                  ),
                );
          },
          itemClick: (Prediction prediction) {
            autoCompleteController.text = prediction.description ?? '';
            autoCompleteController.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0),
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
          seperatedBuilder:
              Divider(color: CommonColors.primary.withOpacity(.1)),
          isCrossBtnShown: true,
          containerHorizontalPadding: 50,
        );

        final searchIcon = Icon(
          Icons.search,
          color: CommonColors.primary,
        );

        getUserCurrentLocation() {
          debugPrint('clicks');
          geo(() async {
            await Geolocator.getCurrentPosition().then(
              (currLocation) async {
                mapInfo.animateCamera(
                  LatLng(currLocation.latitude, currLocation.longitude),
                  zoom: 11,
                );

                // get placemark(address) of current location
                await tryCall(
                  () => placemarkFromCoordinates(
                    currLocation.latitude,
                    currLocation.longitude,
                  ),
                ).then(
                  (placemarks) {
                    var placemark = placemarks[0];

                    context.read<RegCubit>().setLocation(
                          state.copyWith(
                            latitude: currLocation.latitude,
                            longitude: currLocation.longitude,
                            location: '${placemark.subAdministrativeArea}, '
                                '${placemark.administrativeArea}, '
                                '${placemark.country}',
                          ),
                        );
                  },
                );
              },
            );
          }, true, context);
        }

        final pinButton = IconButton(
          onPressed: getUserCurrentLocation,
          icon: SvgPicture.asset(AppAssets.mapPinIcon),
        );

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
                  placesAutocompleteField,
                  Positioned(top: 0, bottom: 0, left: 16, child: searchIcon),
                  Positioned(top: 5, bottom: 5, right: 5, child: pinButton),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildAddressCard() {
    return BlocSelector<RegCubit, RegState, Address>(
      selector: (RegState state) => state.address,
      builder: (context, address) {
        if (address.latitude == null) return const SizedBox();

        bool validateAddressForm() {
          if (!(formKey.currentState?.validate() ?? false)) return false;

          List<List<Object>> addressFormValidFields = [
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

          var trueV = addressFormValidFields.firstWhere(
            (element) => element[0] as bool,
            orElse: () => [false],
          );

          if (!(trueV[0] as bool)) return true;

          G().snackBar(trueV[1] as String);

          return false;
        }

        final addressTitleField = TextFormFieldTemplate(
          initialValue: address.addressTitle,
          key: addressTitleKey,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          onSave: (value) => address = address.copyWith(addressTitle: value),
          validators: (val) =>
              (val?.length ?? 0) < 3 ? 'Minimum 3 characters required' : null,
          hintText: 'Address Title, eg: My Home Address',
          label: "Address Title",
        );

        final addressDetailsField = TextFormFieldTemplate(
          initialValue: address.addressDetails,
          key: addressDetailsKey,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          onSave: (value) => address = address.copyWith(addressDetails: value),
          validators: (val) =>
              (val?.length ?? 0) < 8 ? 'Minimum 8 characters required' : null,
          hintText: 'Address Details, eg: House No., Building Name, etc',
          label: 'Adddress Details',
        );

        final addressLocationRow = Row(
          children: [
            SvgPicture.asset(AppAssets.mapPinIcon),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(address.location ?? ''),
            ),
          ],
        );

        final submitButton = InteractiveButton(
          label: S.of(context).ok,
          onPressed: () async {
            formKey.currentState!.save();
            if (!validateAddressForm()) return;

            context.read<RegCubit>().setLocation(address);
            await context.read<RegCubit>().saveLocation(routeFn: routeFn);
          },
        );

        return Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    addressTitleField,
                    const SizedBox(height: 20),
                    addressDetailsField,
                    const SizedBox(height: 20),
                    addressLocationRow,
                    const SizedBox(height: 20),
                    submitButton,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
