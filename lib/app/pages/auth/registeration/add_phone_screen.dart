import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/core/util/constants.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';

@RoutePage()
class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final ctrl = TextEditingController();

    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: BlocSelector<RegCubit, NRegState, String>(
            selector: (state) => state.singupData?.fullName ?? "",
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
                            onPressed: () async {
                              if (!form.currentState!.validate()) return;

                              var value = ctrl.text.trim();

                              await () async {
                                final profileCubit =
                                    context.read<ProfileCubit>();
                                if (profileCubit.state.form.guid.isEmpty) {
                                  await profileCubit.getProfileForm();
                                }
                              }()
                                  .then((_) async {
                                await context
                                    .read<RegCubit>()
                                    .setMobile(value)
                                    .then((value) {
                                  if (value != null) G.snackBar(value);
                                });
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
