import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/features/settings/profile/model/profile_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final profile = context.watch<ProfileBloc>().state.profile;

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
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Expanded(child: Container()),
              IconButton(
                icon: SvgPicture.asset('assets/images/pin.svg'),
                onPressed: () {
                  showAlertDialog(
                    context: context,
                    title: Container(),
                    content: BioForm(profile, formKey),
                    actions: {'Cancel': null},
                    actionWidgets: [BioFormSubmitButton(profile, formKey)],
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
                profile.bio.isNotEmpty ? profile.bio : S.of(context).writeABio,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

class BioForm extends StatelessWidget {
  final Profile profile;
  final GlobalKey<FormState> formKey;

  const BioForm(this.profile, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    final profileFormBloc = context.read<ProfileBloc>();

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (!state.status.isSuccess) return;

        context.router.pop();

        profileFormBloc.add(
          ProfileLoadedEvent(),
        );
      },
      builder: (context, state) {
        if (state.status.isLoading) {
          return const SizedBox(
            height: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Form(
          key: formKey,
          child: SizedBox(
            height: 80,
            child: TextFormFieldTemplate(
              borderStyle: TextFormFieldBorderStyle.borderBottom,
              initialValue: profile.bio,
              minLines: 3,
              maxLines: 5,
              hintText: S.of(context).writeABio,
              validators: requiredValidator,
              onSave: (value) {
                var profile = state.profile;

                profileFormBloc.add(
                  ProfileUpdateEvent(
                      context: context, profile: profile.copyWith(bio: value)),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class BioFormSubmitButton extends StatelessWidget {
  final Profile profile;
  final GlobalKey<FormState> formKey;

  const BioFormSubmitButton(this.profile, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextButton(
          child: Text(S.of(context).save),
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: SnackBarMassage(massage: S.of(context).invalidInput),
              ));

              return;
            }
            formKey.currentState?.save();
          },
        );
      },
    );
  }
}
