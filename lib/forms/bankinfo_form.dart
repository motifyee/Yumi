import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/bank-account/bankinfo_bloc.dart';
import 'package:yumi/bloc/bank-account/form/bankinfo_form_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/bankinfo_model.dart';
import 'package:yumi/service/bankinfo_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

final GlobalKey<FormState> bankInfoForm = GlobalKey<FormState>();

class BankInfoFormSubmitButtons extends StatelessWidget {
  const BankInfoFormSubmitButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankInfoFormBloc, BankInfoFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Container()),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ThemeSelector.colors.secondary,
              ),
              onPressed: () {
                context.router.pop();
                context
                    .read<BankInfoFormBloc>()
                    .add(BankInfoFormUpdateEvent(bankInfo: BankInfo()));
              },
              child: Text(S.of(context).cancel),
            ),
            SizedBox(
              width: ThemeSelector.statics.defaultLineGap * 2,
            ),
            TextButton(
              child: Text(S.of(context).save),
              onPressed: () {
                if (bankInfoForm.currentState == null ||
                    !bankInfoForm.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        SnackBarMassage(massage: S.of(context).invalidInput),
                  ));
                  return;
                }

                bankInfoForm.currentState!.save();

                if (!context.mounted) return;

                context
                    .read<BankInfoFormBloc>()
                    .add(const BankInfoFormUpdateEvent(loading: true));

                Future.delayed(const Duration(seconds: 1)).then((value) async {
                  final dynamic res;
                  if (state.bankInfo.id.isEmpty) {
                    res = await BankInfoService.addBankInfo(
                        context: context, data: state.bankInfo.toJson());
                  } else {
                    res = await BankInfoService.updateBankInfo(
                        context: context, data: state.bankInfo.toJson());
                  }

                  if (!context.mounted) return;

                  context
                      .read<BankInfoFormBloc>()
                      .add(const BankInfoFormUpdateEvent(loading: false));

                  if (res != null && res != false) {
                    Navigator.of(context).pop();

                    context
                        .read<BankInfoBloc>()
                        .add(BankInfoEvent(context: context));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SnackBarMassage(
                          massage: res.toString(),
                        ),
                      ),
                    );

                    context
                        .read<BankInfoFormBloc>()
                        .add(BankInfoFormUpdateEvent(bankInfo: BankInfo()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SnackBarMassage(
                            massage: S.of(context).connectionError),
                      ),
                    );
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}

class FormData extends StatelessWidget {
  const FormData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankInfoFormBloc, BankInfoFormState>(
        listener: (context, state) {
      print(state);
    }, builder: (context, state) {
      if (state.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Column(
        children: [
          TextFormFieldTemplate(
            label: S.of(context).bankName,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.bankName,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo.copyWith(bankName: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).accountName,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.accountName,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo.copyWith(accountName: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).accountNumber,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.accountNumber,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo
                      .copyWith(accountNumber: int.parse(value))));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).bankCurrency,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.currency,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo.copyWith(currency: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).iban,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.iban,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo.copyWith(iban: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).swiftCode,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.swiftCode,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo.copyWith(swiftCode: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).branchAddress,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.bankInfo.branchAddress,
            onChange: (value) {
              context.read<BankInfoFormBloc>().add(BankInfoFormUpdateEvent(
                  bankInfo: state.bankInfo.copyWith(branchAddress: value)));
            },
          ),
        ],
      );
    });
  }
}

class BankInfoForm extends StatelessWidget {
  final String id;
  const BankInfoForm({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final bankInfoFormBloc = context.read<BankInfoFormBloc>();

    if (bankInfoFormBloc.state.bankInfo.bankName.isEmpty) {
      BankInfo emptyInfo = BankInfo();
      final bankInfo = context.read<BankInfoBloc>().state.banks.firstWhere(
            (e) => e.id == id,
            orElse: () => emptyInfo,
          );
      bankInfoFormBloc.add(BankInfoFormUpdateEvent(bankInfo: bankInfo));
    }

    return BlocConsumer<BankInfoFormBloc, BankInfoFormState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
            return Form(
              key: bankInfoForm,
              child: Container(
                padding: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
                child: const SingleChildScrollView(child: FormData()),
              ),
            );
          }));
        });
  }
}
