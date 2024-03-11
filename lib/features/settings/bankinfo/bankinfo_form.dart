import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/features/settings/bankinfo/bankinfo_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

final GlobalKey<FormState> bankInfo = GlobalKey<FormState>();

class BankInfoSubmitButtons extends StatelessWidget {
  const BankInfoSubmitButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankInfoBloc, BankInfoState>(
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

                context.read<BankInfoBloc>().add(BankInfoFormResetEvent());
              },
              child: Text(S.of(context).cancel),
            ),
            SizedBox(
              width: ThemeSelector.statics.defaultLineGap * 2,
            ),
            TextButton(
              child: Text(S.of(context).save),
              onPressed: () {
                if (bankInfo.currentState == null ||
                    bankInfo.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        SnackBarMassage(massage: S.of(context).invalidInput),
                  ));
                  return;
                }

                bankInfo.currentState!.save();

                if (!context.mounted) return;

                // context
                //     .read<BankInfoBloc>()
                //     .add( BankInfoUpdateEvent(context: context));

                Future.delayed(const Duration(seconds: 1)).then((value) async {
                  final dynamic res;
                  if (state.selectedBank.id.isEmpty) {
                    res = await BankInfoService.addBankInfo(
                        context: context, data: state.selectedBank.toJson());
                  } else {
                    res = await BankInfoService.updateBankInfo(
                        context: context, data: state.selectedBank.toJson());
                  }

                  if (!context.mounted) return;

                  // context
                  //     .read<BankInfoBloc>()
                  //     .add(const BankInfoUpdateEvent(bankInfo: ));

                  if (res != null && res != false) {
                    Navigator.of(context).pop();

                    context
                        .read<BankInfoBloc>()
                        .add(BankInfoInitEvent(context: context));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SnackBarMassage(
                          massage: res.toString(),
                        ),
                      ),
                    );

                    // context.read<BankInfoBloc>().add(
                    //     const BankInfoUpdateEvent(bankInfo: BankInfo()));
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
    return BlocConsumer<BankInfoBloc, BankInfoState>(
        listener: (context, state) {
      print(state);
    }, builder: (context, state) {
      if (state.status.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Column(
        children: [
          TextFormFieldTemplate(
            label: S.of(context).bankName,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.bankName,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank.copyWith(bankName: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).accountName,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.accountName,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank.copyWith(accountName: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).accountNumber,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.accountNumber,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank
                      .copyWith(accountNumber: int.parse(value))));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).bankCurrency,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.currency,
            validators: requiredValidator,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank.copyWith(currency: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).iban,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.iban,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank.copyWith(iban: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).swiftCode,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.swiftCode,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank.copyWith(swiftCode: value)));
            },
          ),
          SizedBox(height: ThemeSelector.statics.defaultLineGap * 2),
          TextFormFieldTemplate(
            label: S.of(context).branchAddress,
            borderStyle: TextFormFieldBorderStyle.borderBottom,
            initialValue: state.selectedBank.branchAddress,
            onChange: (value) {
              context.read<BankInfoBloc>().add(BankInfoUpdateEvent(
                  context: context,
                  bankInfo: state.selectedBank.copyWith(branchAddress: value)));
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
    final bankInfoBloc = context.read<BankInfoBloc>();

    if (bankInfoBloc.state.selectedBank.bankName.isEmpty) {
      bankInfoBloc.add(BankInfoInitEvent(
        context: context,
      ));
    }

    return BlocConsumer<BankInfoBloc, BankInfoState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
            return state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: bankInfo,
                    child: Container(
                      padding:
                          EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
                      child: const SingleChildScrollView(child: FormData()),
                    ),
                  );
          }));
        });
  }
}
