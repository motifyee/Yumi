import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:common_code/domain/vehicle/entities/vehicle.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:common_code/domain/vehicle/use_cases/get_vehicle.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var vehicles = ['Car', 'Motorcycle', 'Bicycle', 'Other'];
    final vehicles = [
      const Vehicle(typeCode: 1),
      const Vehicle(typeCode: 2),
      const Vehicle(typeCode: 3),
      const Vehicle(typeCode: 4),
    ];
    final vehicleIcons = [
      Icons.directions_car,
      Icons.motorcycle,
      Icons.directions_bike,
    ];
    // var controller = TextEditingController();
    String vehicleOtherType = '';
    final node = FocusNode();

    final regCubit = G().rd<RegCubit>();
    () async {
      if (regCubit.state.vehicle.typeCode != 0) return;

      final task = await GetVehicle().call(NoParams());
      task.fold(
        (l) => null,
        (r) => regCubit.setVehicleType(r),
      );
    }();

    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (!regCubit.state.registerationStarted) return;
      if (regCubit.state.vehicle.vehicleName()?.isNotEmpty ?? false) return;
      addYourVehicleDialog(context);
    });

    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: G().rd<RegCubit>().state.registerationStarted
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
                bottomOpacity: 0,
                scrolledUnderElevation: 0,
                iconTheme: IconThemeData(color: CommonColors.primary),
              ),
        body: BlocBuilder<RegCubit, RegState>(
          builder: (context, state) {
            const ridesBGImage = Image(image: AssetImage(AppAssets.ridesIcon));

            // Toggle Buttons
            Widget buildToggleButton(int i, Vehicle e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if (i <= 2) Icon(vehicleIcons[i]),
                      const SizedBox(width: 10),
                      Text(e.vehicleName()?.capitalize() ?? 'Other'),
                    ],
                  ),
                );

            final toggleButtons = ToggleButtons(
              isSelected: List.generate(
                vehicles.length,
                (index) => state.vehicle.typeCode == vehicles[index].typeCode,
              ),
              children: vehicles.mapIndexed(buildToggleButton).toList(),
              onPressed: (int idx) async {
                regCubit.state.canAddVehicle.then((bool canSetVehicle) {
                  final regCubit = G().rd<RegCubit>();

                  if (canSetVehicle) {
                    regCubit.setVehicleType(vehicles[idx]);
                    if (idx == 3) node.requestFocus();
                    return;
                  }

                  regCubit.setVehicleType(regCubit.state.vehicle);
                  return G()
                      .snackBar("You can'nt update your vehicle type now.");
                });
              },
            );

            final customVehicleTypeField = TextFormField(
              initialValue: state.vehicle.vehicleType == VehicleType.other
                  ? state.vehicle.otherType
                  : '',
              focusNode: node,
              enabled: state.vehicle.vehicleType == VehicleType.other,
              onChanged: (value) {
                vehicleOtherType = value;
              },
              onTapOutside: (evt) {
                if (vehicleOtherType.length < 3) {
                  return G().snackBar(
                    'Custom vehicle type must be at least 3 characters long',
                  );
                }

                G().rd<RegCubit>().setVehicleType(
                      state.vehicle.copyWithVehicleType(vehicleOtherType),
                    );
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your vehicle type',
              ),
            );

            return SingleChildScrollView(
              child: Column(
                children: [
                  const Row(children: [Expanded(child: ridesBGImage)]),
                  const SizedBox(height: 40),
                  state.ridesStatus.isLoading
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            toggleButtons,
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: customVehicleTypeField,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: const Text('Choose your vehicle type:'),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void addYourVehicleDialog(BuildContext context, {bool firstTime = true}) {
  showAlertDialog(
    context: context,
    content: SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset(AppAssets.motorcycleIcon)),
          const SizedBox(height: 8),
          Text(
            '         Now',
            style: TextStyle(
              color: CommonColors.primary,
              fontSize: CommonFontSize.font_14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            firstTime
                ? '         Please spicify your vehicle type.'
                : '         You should add your vehicle to continue.',
            style: const TextStyle(
              fontSize: CommonFontSize.font_14,
            ),
          ),
        ],
      ),
    ),
    actions: {S.of(context).next: null},
  );
}
