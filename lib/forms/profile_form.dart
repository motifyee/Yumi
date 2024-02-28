import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/profile/form/profile_form_bloc.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/forms/Ingredients_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/profile_model.dart';
import 'package:yumi/service/profile_service.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/template/upload_photo_button.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/required_validator.dart';

final GlobalKey<FormState> profileForm = GlobalKey<FormState>();

class FormSubmitButtons extends StatelessWidget {
  const FormSubmitButtons({
    super.key,
  });

  // final profileForm = GlobalKey<FormState>().currentState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              child: Text(S.of(context).save),
              onPressed: () async {
                if (profileForm.currentState != null &&
                    profileForm.currentState!.validate()) {
                  // context.read<ProfileFormBloc>()add(ProfileFormSubmitEvent());
                  profileForm.currentState!.save();

                  final res = await ProfileService.updateProfile(
                      context: context, data: state.profileModel.toJson());

                  if (res) {
                    // final profile = ProfileModel.fromJson(res.data as Map);
                    if (context.mounted) {
                      context
                          .read<ProfileBloc>()
                          .add(ProfileEvent(context: context));
                    }
                  } else {
                    if (context.mounted) {
                      context.read<ProfileFormBloc>().add(
                          ProfileFormUpdateEvent(profileModel: ProfileModel()));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: SnackBarMassage(
                              massage: S.of(context).connectionError),
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class ProfilFormData extends StatelessWidget {
  const ProfilFormData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileFormBloc, ProfileFormState>(
        listener: (context, state) {},
        builder: (context, state) => Column(
              children: [
                TextFormFieldTemplate(
                  label: S.of(context).firstName,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.firstName,
                  validators: requiredValidator,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(firstName: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                TextFormFieldTemplate(
                  label: S.of(context).lastName,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.lastName,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(lastName: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                TextFormFieldTemplate(
                  label: S.of(context).userName,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.userName,
                  validators: requiredValidator,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(userName: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                TextFormFieldTemplate(
                  label: S.of(context).email,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.email,
                  validators: emailValidator,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(email: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                TextFormFieldTemplate(
                  label: S.of(context).mobile,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.mobile,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(mobile: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                TextFormFieldTemplate(
                  label: S.of(context).address,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.address,
                  validators: requiredValidator,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(address: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                TextFormFieldTemplate(
                  label: S.of(context).about,
                  labelIcon: 'assets/images/meal_name.svg',
                  borderStyle: TextFormFieldBorderStyle.borderBottom,
                  initialValue: state.profileModel.about,
                  onSave: (value) {
                    context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                        profileModel:
                            state.profileModel.copyWith(about: value)));
                  },
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                // const Divider(height: 0),
                CheckboxListTile(
                  value: state.profileModel.pickup,
                  onChanged: (bool? value) {
                    context.read<ProfileFormBloc>().add(
                          ProfileFormUpdateEvent(
                              profileModel:
                                  state.profileModel.copyWith(pickup: value)),
                        );
                  },
                  title: const Text('Pickup'),
                ),
                CheckboxListTile(
                  value: state.profileModel.pickupOnly,
                  onChanged: (bool? value) {
                    state.profileModel =
                        state.profileModel.copyWith(pickupOnly: value);
                    // context.read<ProfileFormBloc>().add(ProfileFormUpdateEvent(
                    //     profileModel:
                    //         state.profileModel.copyWith(pickupOnly: value)));
                  },
                  title: const Text('Pickup Only'),
                ),
              ],
            ));
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final profileFormBloc = context.read<ProfileFormBloc>();

    if (profileFormBloc.state.profileModel.guid.isEmpty) {
      profileFormBloc.add(
        ProfileFormUpdateEvent(
          profileModel: context.read<ProfileBloc>().state.profile.copyWith(
              // updatedBy: context.read<UserBloc>().state.user.chefId,
              // updatedBy: '366'
              ),
        ),
      );
    }

    return BlocConsumer<ProfileFormBloc, ProfileFormState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 5),
                        ProfilFormData(),
                        FormSubmitButtons()
                      ],
                    ),
                  ),
                ),
              ),
            );
          }));
        });
  }
}
