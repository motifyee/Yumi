import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/registeration/pages/registeration_step.dart';
import 'package:yumi/core/util/constants.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/screen_container.dart';
import 'package:yumi/app/components/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';

@RoutePage()
class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterationPage(
      step: RegStep.addPhone,
      nextStep: RegStep.otp,
      page: AddPhoneContent(),
    );
  }
}

class AddPhoneContent extends StatelessWidget {
  const AddPhoneContent({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final ctrl = TextEditingController();
    final regCubit = context.read<RegCubit>();

    return PopScope(
      canPop: regCubit.state.partialFlow ? true : false,
      onPopInvoked: (didPop) {
        if (!regCubit.state.partialFlow) askToLogout(context);
      },
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: BlocSelector<RegCubit, RegState, String>(
              selector: (state) => state.signupData.fullName ?? "",
              builder: (context, state) {
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/registeration/add_phone.png",
                          ),
                          const SizedBox(height: 60),
                          Text(
                            "Hi ${state.split(" ").first},",
                            style: TextStyle(
                              fontSize: ThemeSelector.fonts.font_24,
                              fontWeight: FontWeight.bold,
                              color: ThemeSelector.colors.primary,
                            ),
                          ),
                          Text(
                            "Enter your phone number",
                            style: TextStyle(
                              fontSize: ThemeSelector.fonts.font_10,
                              color: ThemeSelector.colors.secondaryTant,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Form(
                            key: form,
                            child: TextFormFieldTemplate(
                              label: "Enter Mobile Number",
                              prefixText: '+$kUKCountryCode ',
                              textInputType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validators: mobileValidator,
                              controller: ctrl,
                            ),
                          ),
                          const SizedBox(height: 40),
                          InteractiveButton(
                            label: "Get OTP",
                            onPressed: () => _getOtp(context, form, ctrl),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _getOtp(
  BuildContext context,
  GlobalKey<FormState> form,
  TextEditingController ctrl,
) async {
  if (!form.currentState!.validate()) return;

  var value = ctrl.text.trim();

  await () async {
    final profileCubit = context.read<ProfileCubit>();
    if (profileCubit.state.form.guid.isEmpty) {
      await profileCubit.getProfileForm();
    }
  }()
      .then((_) async {
    await context.read<RegCubit>().setMobile(value).then((value) {
      if (value == null) return RegisterationPage.of(context)?.next();

      G.snackBar(value);
    });
  });
}