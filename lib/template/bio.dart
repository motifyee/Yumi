import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: G.rd<ProfileCubit>().state.form.bio,
      validator: (value) =>
          value == null || value.trim().isEmpty ? S.of(context).required : null,
      builder: (fieldState) => BlocSelector<ProfileCubit, ProfileState, String>(
        selector: (profileState) => profileState.form.bio,
        builder: (context, state) {
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
                          content: BioForm(state, formKey, fieldState),
                          actions: {
                            'Cancel': (_) => G.pop(),
                            'Save': (_) {
                              if (formKey.currentState!.validate()) {
                                return formKey.currentState?.save();
                              }

                              G.snackBar(S.of(context).invalidInput);
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.formFieldGap),
                Container(
                  constraints: BoxConstraints(
                      minHeight: ThemeSelector.statics.defaultBlockGap),
                  child: Center(
                    child: Text(
                      state.isNotEmpty ? state : S.of(context).writeABio,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: ThemeSelector.fonts.font_10,
                          ),
                    ),
                  ),
                ),
                if (fieldState.hasError)
                  Text(
                    fieldState.errorText ?? '',
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BioForm extends StatelessWidget {
  final String bio;
  final GlobalKey<FormState> formKey;
  final FormFieldState<String> fieldState;

  const BioForm(this.bio, this.formKey, this.fieldState, {super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (!state.form.entityStatus.isSuccess) return;

        Navigator.of(context).pop();

        // profileFormBloc.add( ProfileLoadedEvent(),);
      },
      builder: (context, state) {
        if (state.form.entityStatus.isLoading) {
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
              initialValue: bio,
              minLines: 3,
              maxLines: 5,
              hintText: S.of(context).writeABio,
              validators: requiredValidator,
              onSave: (value) async {
                final p = await profileCubit
                    .updateProfileForm(state.form.copyWith(bio: value));

                fieldState.didChange(p?.bio);
              },
            ),
          ),
        );
      },
    );
  }
}

class BioFormSubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const BioFormSubmitButton(this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return TextButton(
          child: Text(S.of(context).save),
          onPressed: () async {},
        );
      },
    );
  }
}
