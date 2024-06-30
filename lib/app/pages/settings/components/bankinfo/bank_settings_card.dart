import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/cubit/bankinfo_cubit.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/settings/components/bankinfo/bankinfo_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/dialog.dart';

class BankSettingsCard extends StatelessWidget {
  final BankInfo bankInfo;
  const BankSettingsCard({super.key, required this.bankInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(
          top: ThemeSelector.statics.defaultTitleGap,
          right: ThemeSelector.statics.defaultTitleGap,
          left: ThemeSelector.statics.defaultTitleGap,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(ThemeSelector.statics.defaultLineGap),
          decoration: BoxDecoration(
            color: ThemeSelector.colors.background,
            borderRadius: BorderRadius.circular(
                ThemeSelector.statics.defaultBorderRadiusSmall),
            boxShadow: [
              BoxShadow(
                color: ThemeSelector.colors.secondary.withOpacity(.15),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(2, 4),
              )
            ],
          ),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/bank.svg',
                    colorFilter: ColorFilter.mode(
                        ThemeSelector.colors.secondary, BlendMode.srcIn),
                  ),
                  SizedBox(width: ThemeSelector.statics.defaultGap),
                  Text(S.of(context).bankAccount),
                  const Expanded(child: SizedBox()),
                  // if (bankInfo.id.isNotEmpty)
                  TextButton(
                      onPressed: () =>
                          showBankInfoForm(context, id: bankInfo.id),
                      child: Text(
                        S.of(context).edit,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ))
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultLineGap),

              BankInfoFields(bankInfo: bankInfo)
            ],
          ),
        ),
      ),
    );
  }
}

class BankInfoFields extends StatelessWidget {
  final BankInfo bankInfo;

  const BankInfoFields({super.key, required this.bankInfo});

  @override
  Widget build(BuildContext context) {
    final bankNameRow = Row(
      children: [
        Text(
          S.of(context).bankName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.bankName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    final accountNameRow = Row(
      children: [
        Text(
          S.of(context).accountName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.accountName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    final accountNumberRow = Row(
      children: [
        Text(
          S.of(context).accountNumber,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.accountNumber,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    final currnecyRow = Row(
      children: [
        Text(
          S.of(context).bankCurrency,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.currency,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    final ibanRow = Row(
      children: [
        Text(
          S.of(context).iban,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.iban,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    final swiftRow = Row(
      children: [
        Text(
          S.of(context).swiftCode,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.swiftCode,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    final branchAddressRow = Row(
      children: [
        Text(
          S.of(context).branchAddress,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(child: Text('')),
        Text(
          bankInfo.branchAddress,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ThemeSelector.colors.secondaryTant),
        ),
      ],
    );

    return BlocBuilder<BankInfoCubit, BankInfoState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.bankInfoForm.id.isEmpty) {
          context.read<BankInfoCubit>().getBankInfo();
        }

        return Column(
          children: [
            bankNameRow,
            SizedBox(height: ThemeSelector.statics.defaultGap),
            accountNameRow,
            SizedBox(height: ThemeSelector.statics.defaultGap),
            accountNumberRow,
            SizedBox(height: ThemeSelector.statics.defaultGap),
            currnecyRow,
            SizedBox(height: ThemeSelector.statics.defaultGap),
            ibanRow,
            SizedBox(height: ThemeSelector.statics.defaultGap),
            swiftRow,
            SizedBox(height: ThemeSelector.statics.defaultGap),
            branchAddressRow,
          ],
        );
      },
    );
  }
}

void showBankInfoForm(BuildContext context, {String id = ''}) {
  showAlertDialog(
      context: context,
      title: Container(),
      content: BankInfoForm(id: id),
      actionWidgets: [const BankInfoSubmitButtons()]);
}
