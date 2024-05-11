import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/chef_application/bloc.dart';
import 'package:yumi/forms/util/form_submit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
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
        TextFormFieldTemplate(
          label: S.of(context).mobile,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: profile.mobile,
          onSave: (value) => save(profile0 = profile0.copyWith(mobile: value)),
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
          FormField<bool>(
            initialValue: profile.pickupOnly,
            onSaved: (value) =>
                save(profile0 = profile0.copyWith(pickupOnly: value ?? false)),
            builder: (fieldState) => CheckboxListTile(
              value: fieldState.value,
              onChanged: (bool? value) => fieldState.didChange(value),
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
    context.read<ProfileCubit>().getProfileForm();

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (!state.form.entityStatus.isError &&
            !state.form.entityStatus.isSuccess) return;

        if (!state.form.entityStatus.isSuccess) return;
        context.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: 2));
      },
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
                                      G.snackBar(state.form.entityStatus
                                          .messageOrMapStatus(
                                              success: "Success!",
                                              error: "Error!"));
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
