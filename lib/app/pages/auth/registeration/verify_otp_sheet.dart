import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/driver/count_down/cubit/count_down_cubit.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/presentation/otp.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

enum OTPType {
  email,
  mobile,
}

class VerifyOtpSheetProvider extends StatelessWidget {
  final OTPType type;
  final String value;
  final String? otp;
  const VerifyOtpSheetProvider({
    this.type = OTPType.email,
    required this.value,
    this.otp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountDownCubit>(
      create: (context) => CountDownCubit(),
      child: VerifyOtpSheet(
        type: type,
        value: value,
        otp: otp,
      ),
    );
  }
}

class VerifyOtpSheet extends StatelessWidget {
  final OTPType type;
  final String value;
  final String? otp;
  const VerifyOtpSheet({
    required this.type,
    required this.value,
    this.otp,
    super.key,
  });

  static String storageKeyBase = 'verify_otp_sheet';
  static storageKey(OTPType type) => '$storageKeyBase-${type.name}';

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CountDownCubit>();

    () async {
      if (counter.state.countDown != null) return;
      await counter.init(storageKey: storageKey(type));

      if (!counter.state.isRunning) await counter.startCountDown(value: value);
    }();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(
          top: ThemeSelector.statics.iconSizeSmall,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtraLarge),
            topLeft: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtraLarge),
          ),
          gradient: screenGradient,
        ),
        width: MediaQuery.of(context).size.width,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .7),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              bottomOpacity: 0,
              scrolledUnderElevation: 0,
              // iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
              leading: IconButton(
                icon:
                    Icon(Icons.arrow_back, color: ThemeSelector.colors.primary),
                onPressed: () {
                  // return G.pop(rootNavigator: false);
                },
              )),
          body: Padding(
            padding: EdgeInsets.only(
              left: ThemeSelector.statics.defaultBlockGap,
              right: ThemeSelector.statics.defaultBlockGap,
              top: ThemeSelector.statics.defaultGapExtreme,
            ),
            child: SingleChildScrollView(
              child: VerifyOTPSheetContent(type: type, otp: otp),
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyOTPSheetContent extends StatelessWidget {
  final OTPType type;
  final String? otp;
  const VerifyOTPSheetContent({
    super.key,
    required this.type,
    this.otp,
  });

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CountDownCubit>();
    if (otp?.length == 4) counter.setValue(otp ?? '');

    return Column(
      children: [
        Text(
          'Enter 4 digits code',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Enter code sent to your email.',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        // counter
        BlocSelector<CountDownCubit, CountDownState, int?>(
          selector: (state) => state.countDown,
          builder: (context, countDown) => SizedBox(
            width: (countDown ?? 0) > 0 ? 50 : 175,
            child: InteractiveButton(
              label: (countDown ?? 0) > 0 ? countDown.toString() : "Resend OTP",
              buttonType: ButtonType.text,
              foregroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () async {
                if ((counter.state.countDown ?? 0) > 0) return;

                switch (type) {
                  case OTPType.email:
                    return sendEmailOTP(context);

                  case OTPType.mobile:
                    return sendMobileOTP(context);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 200,
            child: OTP(
              initialOTP: otp,
              onInput: (value, _, __) {
                // counter.setValue(value);
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        InteractiveButton(
          label: 'Send',
          onPressed: () async {
            switch (type) {
              case OTPType.email:
                return verifyEmailOTP(context, counter.state.value);

              case OTPType.mobile:
                return verifyMobileOTP(context, counter.state.value);
            }
          },
        ),
        const SizedBox(height: 60),
      ],
      // );
      // },
    );
  }
}

void sendEmailOTP(BuildContext context) async {
  final reg = context.read<RegCubit>();
  final counter = context.read<CountDownCubit>();

  await reg.getEmailOTP(reg.state.email!).then((value) {
    counter.restart();
  });
}

void verifyEmailOTP(BuildContext context, String otp) {
  final reg = context.read<RegCubit>();
  final counter = context.read<CountDownCubit>();

  if (otp.length < 4) {
    return G.snackBar("Invalid OTP!");
  }

  if (!reg.verifyEmailOTP(otp)) {
    return G.snackBar("Wrong OTP!");
  }

  G.snackBar("Your email was verified successfully");
  counter.stopCountDown(); // not to emit after close
  Navigator.of(context).pop();
}

void sendMobileOTP(BuildContext context) async {
  final profileCubit = context.read<ProfileCubit>();
  final counter = context.read<CountDownCubit>();

  await profileCubit.getMobileOTP().then((value) {
    counter.restart();
  });
}

void verifyMobileOTP(BuildContext context, String otp) async {
  final profileCubit = context.read<ProfileCubit>();
  final counter = context.read<CountDownCubit>();

  if (otp.length < 4) {
    return G.snackBar("Invalid OTP!");
  }

  await profileCubit.verifyMobileOTP(otp).then((value) {
    if (!value) return G.snackBar("Wrong OTP!");

    G.snackBar("Your mobile was verified successfully");
    counter.stopCountDown(); // not to emit after close
    Navigator.of(context).pop();
  });
}
