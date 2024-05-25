import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/core/util/constants.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/forms/util/form_submit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/required_validator.dart';

final GlobalKey<FormState> profileForm = GlobalKey<FormState>();

class ProfileFormSubmitButton extends StatelessWidget {
  const ProfileFormSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // if (state.form.entityStatus.isSaved) {
        //   context.read<ProfileCubit>().updateProfileForm();
        // }
      },
      builder: (context, state) {
        return TextButton(
          child: Text(S.of(context).save),
          onPressed: () async {
            if (!profileForm.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: SnackBarMassage(massage: S.of(context).invalidInput),
              ));
              return;
            }

            profileForm.currentState!.save();
          },
        );
      },
    );
  }
}

Widget profileFormFields(
  Profile profile,
  Function save,
) {
  var profile0 = profile;

  return BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) => Column(
      children: [
        TextFormFieldTemplate(
          label: S.of(context).fullName,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.fullName,
          validators: requiredValidator,
          onSave: (value) =>
              save(profile0 = profile0.copyWith(fullName: value)),
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        // TextFormFieldTemplate(
        //   label: S.of(context).userName,
        //   borderStyle: TextFormFieldBorderStyle.borderBottom,
        //   initialValue: profile.userName,
        //   validators: requiredValidator,
        //   onSave: (value) =>
        //       save(profile0 = profile0.copyWith(userName: value)),
        // ),
        // SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        // TextFormFieldTemplate(
        //   label: S.of(context).email,
        //   borderStyle: TextFormFieldBorderStyle.borderBottom,
        //   initialValue: profile.email,
        //   validators: emailValidator,
        //   enabled: false,
        //   // onSave: (value) => save(profile0 = profile0.copyWith(email: value)),
        // ),
        // SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        Stack(
          children: [
            TextFormFieldTemplate(
              label: S.of(context).mobile,
              borderStyle: TextFormFieldBorderStyle.borderBottom,
              initialValue: profile.mobile
                  .replaceFirst(RegExp(r'^' + kUKCountryCode), ''),
              textInputType: TextInputType.number,
              validators: mobileValidator,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              prefixText: '+$kUKCountryCode ',
              onSave: (value) =>
                  save(profile0 = profile0.copyWith(mobile: value)),
              onChange: (value) => profile0 = profile0.copyWith(mobile: value),
            ),
            Positioned(
              right: 0,
              top: 0,
              // bottom: 0,
              child: Container(
                height: 48,
                width: 96,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  // color: Theme.of(context).primaryColor.withOpacity(.7),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    final profileCubit = context.read<ProfileCubit>();
                    return InteractiveButton(
                      height: 48,
                      label: 'Verify',
                      loadingLabel: '',
                      // style: InteractiveButtonStyle(
                      //   backgroundColor: (state.verifiedEmail ?? 'x') ==
                      //           (signupForm.email ?? 'y')
                      //       ? Colors.grey
                      //       : null,
                      // ),
                      onPressed: () async {
                        await profileCubit
                            .setMobile(profile0.mobile)
                            .then((otp) {
                          if (otp == null) {
                            return G.snackBar('Something went wrong');
                          }

                          // showModalBottomSheet(
                          //   context: context,
                          //   // isScrollControlled: true,
                          //   // backgroundColor: Colors.transparent,
                          //   builder: (context) => Container(),
                          // );
                        });

                        // if (state.verifiedEmail == signupForm.email) {
                        //   return G.snackBar(
                        //     "${state.verifiedEmail} is already verified",
                        //   );
                        // }

                        // if (!emailStructure(signupForm.email)) {
                        //   return G.snackBar("Please enter a valid email");
                        // }

                        // await reg.getEmailOTP(signupForm.email!).then(
                        //   (sent) {
                        //     if (!sent) {
                        //       return G.snackBar(
                        //         "Please enter a valid email, nothing sent!",
                        //       );
                        //     }

                        //     G.snackBar("Verification code sent");

                        //     showModalBottomSheet(
                        //       context: context,
                        //       isScrollControlled: true,
                        //       backgroundColor: Colors.transparent,
                        //       builder: (context) =>
                        //           const VerifyRegisterEmailOtpSheetProvider(),
                        //     );
                        //   },
                        // );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        // TextFormFieldTemplate(
        //   label: S.of(context).address,
        //   borderStyle: TextFormFieldBorderStyle.borderBottom,
        //   initialValue: profile.address,
        //   validators: requiredValidator,
        //   onSave: (value) => save(profile0 = profile0.copyWith(address: value)),
        // ),
        // SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        if (!G.isCustomerApp)
          TextFormFieldTemplate(
            label: S.of(context).about,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: profile.about,
            onSave: (value) => save(profile0 = profile0.copyWith(about: value)),
          ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        // const Divider(height: 0),
        // FormField<bool>(
        //   initialValue: profile.pickup,
        //   onSaved: (value) =>
        //       save(profile0 = profile0.copyWith(pickup: value ?? false)),
        //   builder: (fieldState) => CheckboxListTile(
        //     value: fieldState.value,
        //     onChanged: (bool? value) => fieldState.didChange(value),
        //     title: const Text('Pickup'),
        //   ),
        // ),
        if (G.isChefApp)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 60,
                child: SvgPicture.asset('assets/images/pickup-available.svg'),
              ),
              SizedBox(
                height: 60,
                child: InkWell(
                  onTap: () {
                    context.read<ProfileCubit>().toggleDeliveryAvailable();
                    profile0 = profile0.copyWith(
                      pickup: state.form.pickupOnly,
                    );
                  },
                  child: SvgPicture.asset(
                      'assets/images/delivery-${state.form.pickupOnly ? 'not-' : ''}available.svg'),
                ),
              ),
            ],
          ),
      ],
    ),
  );
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfileForm();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profileFormCubit = context.read<ProfileCubit>();

        return Container(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraint) {
              var profile = state.form;

              return Form(
                key: profileForm,
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultBlockGap,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 5),
                        state.form.entityStatus.isLoading
                            ? Container(
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.5,
                                ),
                                child: const Center(
                                    child: CircularProgressIndicator()))
                            : profileFormFields(
                                profile,
                                onFormFieldsSaved<Profile>(
                                  profileForm,
                                  onAllFieldsSaved: (profile, _) async {
                                    await profileFormCubit
                                        .updateProfileForm(profile)
                                        .then((value) {
                                      if (value != null) {
                                        Navigator.of(context).pop();
                                      }
                                      G.snackBar(
                                        context
                                            .read<ProfileCubit>()
                                            .state
                                            .form
                                            .entityStatus
                                            .messageOrMapStatus(
                                              success: "Success!",
                                              error: "Error!",
                                            ),
                                      );
                                    });
                                  },
                                ),
                              ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
