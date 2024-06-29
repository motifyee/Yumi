import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/settings/components/profile/cubit/profile_form_cubit.dart';
import 'package:yumi/core/util/constants.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/regex.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/required_validator.dart';

class ProfileFormProvider extends StatelessWidget {
  const ProfileFormProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileFormCubit>(
      create: (context) => ProfileFormCubit(),
      child: const ProfileForm(),
    );
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileFormCubit>();
    cubit.initializeForm();
    cubit.loadProfile();

    return BlocBuilder<ProfileFormCubit, ProfileFormState>(
      builder: (context, state) {
        final fullNameField = TextFormFieldTemplate(
          label: S.of(context).fullName,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: state.fullName,
          validators: requiredValidator,
          inputFormatters: [
            FilteringTextInputFormatter.allow(CustomRegex.lettersBlankOnly)
          ],
          onSave: (value) => cubit.setState((s) => s.copyWith(fullName: value)),
        );

        final mobileField = TextFormFieldTemplate(
          label: S.of(context).mobile,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: state.mobile,
          textInputType: TextInputType.number,
          validators: mobileValidator,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          prefixText: '+$kUKCountryCode ',
          enabled: false,
          onChange: (value) => cubit.setState((s) => s.copyWith(mobile: value)),
          onSave: (value) => cubit.setState((s) => s.copyWith(mobile: value)),
        );

        final changeMobileButton = Container(
          height: 48,
          width: 96,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          // child: BlocBuilder<ProfileCubit, ProfileState>( builder: (context, state) { },),
          child: InteractiveButton(
            height: 48,
            label: 'Change',
            loadingLabel: '',
            onPressed: () async {
              context.read<RegCubit>().saveStepToCache(RegStep.addPhone.index);
              context.router.push(const RegisterationRoute());
              context.read<RegCubit>().init(
                    partialFlow: true,
                    // stops at subsequent verification
                    lastStep: RegStep.addPhone.index,
                  );
            },
          ),
        );

        final aboutField = TextFormFieldTemplate(
          label: S.of(context).about,
          borderStyle: TextFormFieldBorderStyle.borderBottom,
          initialValue: state.about,
          onSave: (value) => cubit.setState((s) => s.copyWith(about: value)),
        );

        final pickupAndDeliveryIcons = Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60,
              child: SvgPicture.asset('assets/images/pickup-available.svg'),
            ),
            SizedBox(
              height: 60,
              child: InkWell(
                onTap: () => cubit.toggleDeliveryAvailable(),
                child: SvgPicture.asset(
                    'assets/images/delivery-${state.pickupOnly ? 'not-' : ''}available.svg'),
              ),
            ),
          ],
        );

        final spinner = Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );

        final List<Widget> fields = state.isLoading
            ? [spinner]
            : [
                fullNameField,
                SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
                Stack(
                  children: [
                    mobileField,
                    Positioned(
                      right: 0,
                      top: 0,
                      child: changeMobileButton,
                    )
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
                if (!G.isCustomerApp) aboutField,
                SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
                if (G.isChefApp) pickupAndDeliveryIcons,
              ];

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.defaultBlockGap,
          ),
          child: Form(
            key: state.profileFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  ...fields,
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileFormSubmitButton extends StatelessWidget {
  const ProfileFormSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        child: Text(S.of(context).save),
        onPressed: () async {
          final cubit = context.read<ProfileFormCubit>();
          final form = cubit.state.profileFormKey;

          if (form == null) return;
          if (!form.currentState!.validate()) {
            return G.snackBar(S.of(context).invalidInput);
          }

          form.currentState!.save();

          await cubit.updateProfile().then((res) {
            if (res != null) return G.snackBar(res);

            Navigator.of(context).pop();
          });
        },
      );
}
