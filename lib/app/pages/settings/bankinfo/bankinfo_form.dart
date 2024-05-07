import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/forms/util/form_submit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/settings/bankinfo/bankinfo_service.dart';
import 'package:yumi/model/bankinfo_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/required_validator.dart';

final GlobalKey<FormState> bankInfoKey = GlobalKey<FormState>();

class BankInfoSubmitButtons extends StatelessWidget {
  const BankInfoSubmitButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankInfoBloc, BankInfoState>(
      listener: (context, state) async {
        if (!state.status.isSaved) return;

        context.read<BankInfoBloc>().add(BankInfoLoadingEvent());

        final dynamic res;
        if (state.selectedBank.id.isEmpty) {
          res = await BankInfoService.addBankInfo(
              context: context, data: state.bankInfoForm?.toJson() ?? {});
        } else {
          res = await BankInfoService.updateBankInfo(
              context: context, data: state.bankInfoForm?.toJson() ?? {});
        }

        if (!context.mounted) return;
        if (res != null && res != false) {
          Navigator.of(context).pop();

          context.read<BankInfoBloc>().add(BankInfoInitEvent(context: context));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: SnackBarMassage(
                massage: res.toString(),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: SnackBarMassage(massage: S.of(context).connectionError),
            ),
          );
        }
      },
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
                // G.pop();
                context.router.maybePop().then(
                      (value) => context
                          .read<BankInfoBloc>()
                          .add(BankInfoFormResetEvent()),
                    );
              },
              child: Text(S.of(context).cancel),
            ),
            SizedBox(
              width: ThemeSelector.statics.defaultLineGap * 2,
            ),
            TextButton(
              child: Text(S.of(context).save),
              onPressed: () {
                if (bankInfoKey.currentState == null ||
                    !bankInfoKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        SnackBarMassage(massage: S.of(context).invalidInput),
                  ));
                  return;
                }

                bankInfoKey.currentState!.save();
              },
            ),
          ],
        );
      },
    );
  }
}

Widget formData(BankInfo bankInfo, Function save) {
  var bankInfo0 = bankInfo;

  return BlocBuilder<BankInfoBloc, BankInfoState>(
    builder: (ctx, _) {
      List fields = [
        [
          S.of(ctx).bankName,
          bankInfo0.bankName,
          requiredValidator,
          (value) => save(bankInfo0 = bankInfo0.copyWith(bankName: value)),
        ],
        [
          S.of(ctx).accountName,
          bankInfo0.accountName,
          requiredValidator,
          (value) => save(bankInfo0 = bankInfo0.copyWith(accountName: value)),
        ],
        [
          S.of(ctx).accountNumber,
          bankInfo0.accountNumber,
          requiredValidator,
          (value) => save(bankInfo0 = bankInfo0.copyWith(accountNumber: value)),
        ],
        [
          S.of(ctx).bankCurrency,
          bankInfo0.currency,
          requiredValidator,
          (value) => save(bankInfo0 = bankInfo0.copyWith(currency: value)),
        ],
        [
          S.of(ctx).iban,
          bankInfo0.iban,
          null,
          (value) => save(bankInfo0 = bankInfo0.copyWith(iban: value)),
        ],
        [
          S.of(ctx).swiftCode,
          bankInfo0.swiftCode,
          null,
          (value) => save(bankInfo0 = bankInfo0.copyWith(swiftCode: value)),
        ],
        [
          S.of(ctx).branchAddress,
          bankInfo0.branchAddress,
          null,
          (value) => save(bankInfo0 = bankInfo0.copyWith(branchAddress: value)),
        ],
      ];

      return Column(
        children: fields
            .map((field) => [
                  TextFormFieldTemplate(
                    label: field[0] as String,
                    borderStyle: TextFormFieldBorderStyle.borderBottom,
                    initialValue: field[1],
                    validators: field[2] == null
                        ? null
                        : (field[2] as String? Function(String?)),
                    onSave: field[3] as Function(dynamic),
                  ),
                  // gap
                  SizedBox(
                    height: ThemeSelector.statics.defaultLineGap,
                  ),
                ])
            .reduce((v, e) {
          v.addAll(e);
          return v;
        }).toList(),
      );
    },
  );
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
        if (state.statusSet.hasInit) {}

        var bankInfo = state.selectedBank;

        return state.status.isLoading
            ? Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                padding: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
                child: Form(
                  key: bankInfoKey,
                  child: SingleChildScrollView(
                      child: formData(
                          bankInfo,
                          onFormFieldsSaved<BankInfo>(
                            bankInfoKey,
                            onAllFieldsSaved: (info, fields) => context
                                .read<BankInfoBloc>()
                                .add(BankInfoFormSavedEvent(info)),
                          ))),
                ),
              );
      },
    );
  }
}
