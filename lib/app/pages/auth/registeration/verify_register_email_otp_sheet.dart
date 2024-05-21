import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/bloc/bloc.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

// class VerifyRegisterEmailOtpSheetProvider extends StatelessWidget {
//   const VerifyRegisterEmailOtpSheetProvider({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ForgotPwdCubit>(
//       create: (context) => ForgotPwdCubit(),
//       child: const VerifyRegisterEmailOtpSheet(),
//     );
//   }
// }

class VerifyRegisterEmailOtpSheet extends StatelessWidget {
  const VerifyRegisterEmailOtpSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   bottomOpacity: 0,
          //   scrolledUnderElevation: 0,
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back, color: ThemeSelector.colors.primary),
          //     onPressed: () {
          //       final cubit = context.read<ForgotPwdCubit>();
          //       switch (cubit.state.window) {
          //         case ForgotPwdWindow.enterEmail:
          //           return G.pop();
          //         default:
          //           cubit.setWindow(ForgotPwdWindow.enterEmail);
          //       }
          //     },
          //   ),
          // ),
          body: Padding(
            padding: EdgeInsets.only(
              left: ThemeSelector.statics.defaultBlockGap,
              right: ThemeSelector.statics.defaultBlockGap,
              top: ThemeSelector.statics.defaultGapExtreme,
            ),
            child: const SingleChildScrollView(
                // child: BlocBuilder<RegCubit, RegState>(
                //   builder: (context, state) {
                //     final fgCubit = context.read<ForgotPwdCubit>();

                //     if (state == ForgotPwdWindow.enterEmail &&
                //         fgCubit.state.email.isEmpty) {
                //       context.read<ForgotPwdCubit>().init();
                //     }

                //     return Column(
                //       children: [
                //         Text(
                //           'Enter 4 digits code',
                //           style: Theme.of(context).textTheme.titleLarge,
                //         ),
                //         Text(
                //           'Enter code sent to your email.',
                //           style: Theme.of(context).textTheme.labelSmall,
                //         ),
                //         BlocSelector<ForgotPwdCubit, ForgotPasswordState, int?>(
                //           selector: (state) => state.countDown,
                //           builder: (context, countDown) => SizedBox(
                //             width: (countDown ?? 0) > 0 ? 50 : 175,
                //             child: InteractiveButton(
                //               label: (countDown ?? 0) > 0
                //                   ? countDown.toString()
                //                   : "Resend OTP",
                //               buttonType: ButtonType.text,
                //               foregroundColor:
                //                   Theme.of(context).colorScheme.primary,
                //               onPressed: () async {
                //                 if ((countDown ?? 0) > 0) return;
                //                 // await context.read<RegCubit>().verifyEmailOTP();
                //               },
                //             ),
                //           ),
                //         ),
                //         const SizedBox(height: 20),
                //         Center(
                //           child: SizedBox(
                //             width: 200,
                //             // child: OTP(onInput: (value, _, __) => otp = value),
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
