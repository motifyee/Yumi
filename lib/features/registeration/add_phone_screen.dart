import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/driver/driver_reg_cubit.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/repository/mock.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/text_form_field.dart';

@RoutePage()
class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
        ),
        body: SingleChildScrollView(
          child: BlocSelector<RegCubit, NRegState, String>(
            selector: (state) => state.singupData?.fullName ?? "",
            builder: (context, state) {
              // if (state.status.isInit) {
              //   context.read<ScheduleBloc>().add(ScheduleEvent.init(context));
              // }
              // if (state.status.isLoading) {
              //   return const Center(child: CircularProgressIndicator());
              // }

              var form = GlobalKey<FormState>();

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
                              prefixText: '+44 ',
                              textInputType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validators: (value) {
                                return (value?.length ?? 0) == 11
                                    ? null
                                    : "Invalid phone number";
                              }),
                        ),
                        const SizedBox(height: 40),
                        ConfirmButton(
                            label: "Get OTP",
                            onPressed: () {
                              if (!form.currentState!.validate()) return;

                              var value = form.currentState?.fields.first.value
                                  as String;

                              // context
                              //     .read<RegBloc>()
                              //     .add(RegEvent.setPhone(value, context));
                              context.read<RegCubit>().setPhone(value);
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
