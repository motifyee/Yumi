import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/count_down_cubit/count_down_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/global.dart';
import 'package:common_code/components/otp/otp.dart';

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
  static String storageKey(OTPType type) => '$storageKeyBase-${type.name}';

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CountDownCubit>();

    () async {
      if (counter.state.countDown != null) return;
      await counter.init(storageKey: storageKey(type));

      if (!counter.state.isRunning) await counter.start(value: value);
    }();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(
          top: CommonDimens.iconSizeSmall,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight:
                Radius.circular(CommonDimens.defaultBorderRadiusExtraLarge),
            topLeft:
                Radius.circular(CommonDimens.defaultBorderRadiusExtraLarge),
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
            // iconTheme: IconThemeData(color: CommonColors.primary),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: CommonColors.primary),
              onPressed: () {
                // return G().pop(rootNavigator: false);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: CommonDimens.defaultBlockGap,
              right: CommonDimens.defaultBlockGap,
              // top: CommonDimens.defaultGapExtreme,
            ),
            child: VerifyOTPSheetContent(type: type, otp: otp),
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
    // if (otp?.length == 4) counter.setValue(otp ?? '');

    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  label: (countDown ?? 0) > 0
                      ? countDown.toString()
                      : 'Resend OTP',
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
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
          child: SizedBox(
            width: 200,
            child: OTP(
              initialOTP: otp,
              onInput: (value, _, __) {
                counter.setValue(value);
              },
            ),
          ),
        ),
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
  if (otp.replaceAll(' ', '').length < 4) {
    return G().snackBar('Invalid OTP!');
  }

  if (!reg.verifyEmailOTP(otp)) {
    return G().snackBar('Wrong OTP!');
  }

  G().snackBar('Your email was verified successfully');
  counter.stop(); // not to emit after close
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
    return G().snackBar('Invalid OTP!');
  }

  await profileCubit.verifyMobileOTP(otp).then((value) {
    if (!value) return G().snackBar('Wrong OTP!');

    G().snackBar('Your mobile was verified successfully');
    counter.stop(); // not to emit after close
    Navigator.of(context).pop();
  });
}
