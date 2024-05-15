import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/auth/registeration/maps/permission.dart';
import 'package:yumi/app/pages/auth/registeration/model/address.dart';
import 'package:yumi/app/pages/auth/registeration/model/registeration.dart';
import 'package:yumi/app/pages/auth/registeration/repository/address_repo.dart';
import 'package:yumi/domain/profile/use_cases/update_profile.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

//** Flow bloc for registeration process
// It is used to track the current step of the registeration process,
// as well as the data that has been entered by the user.
//
// - The `flowIndex` is Stored at key 'RegFLowIndex' in shared preferences
// - The `data` is stored at key 'RegFlowData' in shared preferences
//
// Steps:
//  1. Registeration Form with name, email, password, phone number
//  2. Phone number
//  3. Phone number verification
//  4. Address
// */
const String RegFlowStepKey = 'RegFLowStep';

class RegBloc extends Bloc<RegEvent, RegState> {
  _navigateTo(int step, BuildContext ctx, Emitter<RegState> emit) async {
    if (step > 4) step = 4;
    if (step < 0) step = 0;

    ctx.navigateNamedTo(state.screenNames[step]);

    emit(state.copyWith(step: step));

    // save step index to shared preferences
    var pref = await SharedPreferences.getInstance();
    pref.setInt(RegFlowStepKey, step);
  }

  RegBloc() : super(const RegState()) {
    on<RegEvent>(
      (event, emit) async {
        await event.map(
          // read step index and navigate to corresponding page
          init: (_init value) async {
            // read step index from shared preferences
            var pref = await SharedPreferences.getInstance();
            var step = pref.getInt(RegFlowStepKey) ?? 0;

            // navigate to corresponding page based on step index
            // must emit routed event
            emit(RegState(step: step));
          },
          loading: (value) {},
          loaded: (value) {},
          next: (value) {
            // increment step index and navigate to corresponding page
            var step = state.step + 1;
            _navigateTo(step, value.ctx, emit);
          },
          previous: (value) {
            // increment step index and navigate to corresponding page
            var step = state.step - 1;
            _navigateTo(step, value.ctx, emit);
          },
          goto: (value) {
            _navigateTo(value.step, value.ctx, emit);
          },

          setAccount: (value) {
            emit(state.copyWith(singupData: value.signupData));
            _navigateTo(1, value.ctx, emit);
          },
          setPhone: (_setPhone phone) async {
            var profile =
                G.rd<ProfileCubit>().state.form.copyWith(mobile: phone.phone);

            UpdateProfile().call(UpdateProfileParam(profile)).then((value) {
              _navigateTo(2, phone.ctx, emit);
              emit(state.copyWith(phone: phone.phone));
            });
            // await xProfileSrc
            //     .updateProfile(
            //   profile.copyWith(mobile: value.phone, updatedBy: '366').toJson(),
            // )
            //     .then((res) {
            //   _navigateTo(2, value.ctx, emit);
            //   emit(state.copyWith(phone: value.phone));
            // });
          },
          setOTP: (_setOTP value) {
            emit(state.copyWith(otp: value.otp));
            _navigateTo(3, value.ctx, emit);
          },
          saveLocation: (_setLocation value) async {
            await tryV(
              () => AddressRepo.addAddress(address: state.address),
            ).then((res) {
              if (res) {
                emit(state.copyWith(addressStatus: Status.success));
                if (value.routeFn != null) {
                  value.routeFn!(address: state.address);
                } else {
                  _navigateTo(4, value.ctx, emit);
                }
                return;
              }

              emit(state.copyWith(addressStatus: Status.error));
            });
          },
          updateLocation: (value) {
            emit(state.copyWith(address: value.address));
          },
        );
      },
    );
  }
}
