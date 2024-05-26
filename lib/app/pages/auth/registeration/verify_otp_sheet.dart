import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/driver/count_down_cubit.dart';
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
  const VerifyOtpSheetProvider({this.type = OTPType.email, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountDownCubit>(
      create: (context) => CountDownCubit(),
      child: VerifyOtpSheet(
        type: type,
      ),
    );
  }
}

class VerifyOtpSheet extends StatelessWidget {
  final OTPType type;
  const VerifyOtpSheet({required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    // final counter = context.read<CountDownCubit>();
    // if (counter.state.countDown == null) counter.startCountDown();

    // return PopScope(
    // canPop: true,
    // onPopInvoked: (didPop) => (didPop) ? counter.stopCountDown() : null,
    // child: Padding(
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
              // child: BlocBuilder<RegCubit, NRegState>(
              //   builder: (context, state) {
              // return
              child: VerifyOTPSheetContent(type: type),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}

class VerifyOTPSheetContent extends StatelessWidget {
  final OTPType type;
  const VerifyOTPSheetContent({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    String otp = '';

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
        BlocBuilder<CountDownCubit, CountDownState>(
          builder: (context, state) => SizedBox(
            width: (state.countDown ?? 0) > 0 ? 50 : 175,
            child: InteractiveButton(
              label: (state.countDown ?? 0) > 0
                  ? state.countDown.toString()
                  : "Resend OTP",
              buttonType: ButtonType.text,
              foregroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () async {
                final counter = context.read<CountDownCubit>();
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
            child: OTP(onInput: (value, _, __) => otp = value),
          ),
        ),
        const SizedBox(height: 30),
        InteractiveButton(
          label: 'Send',
          onPressed: () async {
            switch (type) {
              case OTPType.email:
                return verifyEmailOTP(context, otp);

              case OTPType.mobile:
                return verifyEmailOTP(context, otp);
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
    counter.startCountDown();
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
    counter.startCountDown();
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

    G.snackBar("Your email was verified successfully");
    counter.stopCountDown(); // not to emit after close
    Navigator.of(context).pop();
  });
}
