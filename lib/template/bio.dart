import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/bank-account/form/bankinfo_form_bloc.dart';
import 'package:yumi/bloc/profile/form/profile_form_bloc.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/forms/profile_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/profile_model.dart';
import 'package:yumi/service/profile_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultTitleGap),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/bio.svg'),
              SizedBox(width: ThemeSelector.statics.defaultLineGap),
              Text(
                S.of(context).bio,
                style: TextStyle(
                  color: ThemeSelector.colors.secondary,
                  fontSize: ThemeSelector.fonts.font_14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Expanded(child: Text('')),
              IconButton(
                icon: SvgPicture.asset('assets/images/pin.svg'),
                onPressed: () {
                  showAlertDialog(
                    context: context,
                    title: Container(),
                    content: const BioForm(),
                    actions: {'Cancel': null},
                    actionWidgets: [const BioFormSubmitButton()],
                  );
                },
              )
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Container(
            constraints: BoxConstraints(
                minHeight: ThemeSelector.statics.defaultGapExtreme),
            child: Center(
              child: Text(
                S.of(context).writeABio,
                style: TextStyle(
                  color: ThemeSelector.colors.secondary,
                  fontSize: ThemeSelector.fonts.font_10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final GlobalKey<FormState> bioForm = GlobalKey<FormState>();

class BioForm extends StatelessWidget {
  const BioForm({super.key});

  @override
  Widget build(BuildContext context) {
    final profileFormBloc = context.read<ProfileFormBloc>();

    profileFormBloc.add(
      ProfileFormUpdateEvent(
        profileModel: context.read<ProfileBloc>().state.profile.copyWith(
              // updatedBy: context.read<UserBloc>().state.user.chefId,
              updatedBy: '366',
              email: context.read<UserBloc>().state.user.email,
            ),
      ),
    );

    return BlocConsumer<ProfileFormBloc, ProfileFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Form(
          key: bioForm,
          child: TextFormFieldTemplate(
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            // initialValue: state.profileModel.bio,
            initialValue: 'XXXXXXXXX',
            minLines: 3,
            maxLines: 5,
            hintText: S.of(context).writeABio,
            validators: requiredValidator,
            onSave: (value) {
              profileFormBloc.add(
                ProfileFormUpdateEvent(
                  profileModel: state.profileModel.copyWith(bio: value),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class BioFormSubmitButton extends StatelessWidget {
  const BioFormSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileFormBloc, ProfileFormState>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Form(
          child: Container(
            padding: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
            child: TextButton(
              child: Text(S.of(context).save),
              onPressed: () async {
                if (!bioForm.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        SnackBarMassage(massage: S.of(context).invalidInput),
                  ));

                  return;
                }

                bioForm.currentState!.save();

                Future.delayed(Duration.zero, () async {
                  final res = await ProfileService.updateProfile(
                      context: context, data: state.profileModel.toJson());

                  if (res != null && res != false) {
                    if (context.mounted) {
                      Navigator.of(context).pop();

                      context
                          .read<ProfileBloc>()
                          .add(ProfileEvent(context: context));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: SnackBarMassage(
                            massage: res.toString(),
                          ),
                        ),
                      );

                      context.read<ProfileFormBloc>().add(
                          ProfileFormUpdateEvent(profileModel: ProfileModel()));
                    }
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: SnackBarMassage(
                              massage: S.of(context).connectionError),
                        ),
                      );
                    }
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }
}
