import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/settings/profle/bloc/profile_bloc.dart';
import 'package:yumi/forms/util/form_submit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/profile_model.dart';
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

  // final profileForm = GlobalKey<FormState>().currentState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.status.isSaved) {
          context.read<ProfileBloc>().add(
                ProfileUpdateEvent(
                  context: context,
                  profile: state.profile,
                ),
              );
        }

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
        //   ],
        // );
      },
    );
  }
}

Widget profileFormFields(
  Profile profile,
  Function save,
) {
  var profile0 = profile;
  return BlocBuilder<ProfileBloc, ProfileState>(
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
        TextFormFieldTemplate(
          label: S.of(context).userName,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.userName,
          validators: requiredValidator,
          onSave: (value) =>
              save(profile0 = profile0.copyWith(userName: value)),
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        TextFormFieldTemplate(
          label: S.of(context).email,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.email,
          validators: emailValidator,
          enabled: false,
          // onSave: (value) => save(profile0 = profile0.copyWith(email: value)),
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        TextFormFieldTemplate(
          label: S.of(context).mobile,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.mobile,
          onSave: (value) => save(profile0 = profile0.copyWith(mobile: value)),
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        TextFormFieldTemplate(
          label: S.of(context).address,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.address,
          validators: requiredValidator,
          onSave: (value) => save(profile0 = profile0.copyWith(address: value)),
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        TextFormFieldTemplate(
          label: S.of(context).about,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.about,
          onSave: (value) => save(profile0 = profile0.copyWith(about: value)),
        ),
        SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
        // const Divider(height: 0),
        FormField<bool>(
          onSaved: (value) => save(profile0 = profile0.copyWith(pickup: value)),
          builder: (fieldState) => CheckboxListTile(
            value: profile.pickup,
            // ignore: invalid_use_of_protected_member
            onChanged: (bool? value) => fieldState.setValue(value),
            title: const Text('Pickup'),
          ),
        ),
        FormField<bool>(
          onSaved: (value) =>
              save(profile0 = profile0.copyWith(pickupOnly: value)),
          builder: (fieldState) => CheckboxListTile(
            value: profile.pickupOnly,
            // ignore: invalid_use_of_protected_member
            onChanged: (bool? value) => fieldState.setValue(value),
            title: const Text('Pickup Only'),
          ),
        ),
      ],
    ),
  );
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileInitEvent(context: context));

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // if (state is ProfileFormLoadingState) {
        //   return;
        // }
      },
      builder: (context, state) {
        final profileFormBloc = context.read<ProfileBloc>();

        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraint) {
              var profile = state.profile;

              return Form(
                key: profileForm,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultBlockGap),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 5),
                          state.status.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : profileFormFields(
                                  profile,
                                  onFormFieldsSaved<Profile>(
                                    profileForm,
                                    onAllFieldsSaved: (profile, _) {
                                      profileFormBloc.add(
                                        ProfileFormSavedEvent(profile),
                                      );
                                    },

                                    // (controlsCount) {
                                    //   int saveCount = 0;
                                    //   return (profile0) {
                                    //     saveCount++;
                                    //     profile = profile0;

                                    //     if (saveCount >= controlsCount) {
                                    //       profileFormBloc.add(
                                    //         ProfileFormSavedEvent(profile),
                                    //       );
                                    //     }
                                    //   };
                                    // },
                                  ),
                                ),
                          const SizedBox(height: 5),
                          // FormSubmitButtons()
                        ],
                      ),
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
