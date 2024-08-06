import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/app/pages/auth/forgot_password/view_states/enter_email.dart';
import 'package:yumi/app/pages/auth/forgot_password/view_states/enter_otp.dart';
import 'package:yumi/global.dart';

class ForgotPasswordSheetProvider extends StatelessWidget {
  const ForgotPasswordSheetProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPwdCubit>(
      create: (context) => ForgotPwdCubit(),
      child: const ForgotPasswordSheet(),
    );
  }
}

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                  final cubit = context.read<ForgotPwdCubit>();

                  switch (cubit.state.window) {
                    case ForgotPwdWindow.enterEmail:
                      return G().pop();
                    default:
                      cubit.setWindow(ForgotPwdWindow.enterEmail);
                    // ForgotPwdWindow.enterOTP:
                    // case ForgotPwdWindow.enterPwd:
                    //   return cubit.setWindow(ForgotPwdWindow.enterOTP);
                  }
                },
              )),
          body: Padding(
            padding: const EdgeInsets.only(
              left: CommonDimens.defaultBlockGap,
              right: CommonDimens.defaultBlockGap,
              top: CommonDimens.defaultGapExtreme,
              // bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
                child: BlocSelector<ForgotPwdCubit, ForgotPwdState,
                    ForgotPwdWindow>(
              selector: (state) => state.window,
              builder: (context, state) {
                final fgCubit = context.read<ForgotPwdCubit>();

                if (state == ForgotPwdWindow.enterEmail &&
                    fgCubit.state.email.isEmpty) {
                  context.read<ForgotPwdCubit>().init();
                }

                return switch (state) {
                  ForgotPwdWindow.enterEmail => ForgotPwdEnterEmail(),
                  ForgotPwdWindow.enterOTP => const ForgotPwdEnterOTP(),
                  ForgotPwdWindow.done => () {
                      G().pop();
                      return const ForgotPwdEnterOTP();
                    }(),
                };
              },
            )),
          ),
        ),
      ),
    );
  }
}
