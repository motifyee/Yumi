import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/bank-account/bankinfo_bloc.dart';
import 'package:yumi/forms/bankinfo_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';

class BankSettingsCard extends StatelessWidget {
  final String id;
  const BankSettingsCard({super.key, required this.id});

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
                  if (id.isNotEmpty)
                    TextButton(
                        onPressed: () => showBankInfoEdit(context, id: id),
                        child: Text(
                          S.of(context).edit,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultLineGap),

              if (id.isEmpty)
                IconButton(
                    onPressed: () => showBankInfoEdit(context),
                    icon:
                        Icon(Icons.add, color: ThemeSelector.colors.secondary))
              else
                BankInfoFields(id: id)
            ],
          ),
        ),
      ),
    );
  }
}

class BankInfoFields extends StatelessWidget {
  final String id;

  const BankInfoFields({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<BankInfoBloc>(context).add(BankInfoEvent(context: context));

    return BlocConsumer<BankInfoBloc, BankInfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          dynamic empty = {};
          final bankInfo = state.banks.firstWhere(
            (e) => e.id == id,
            orElse: () => empty,
          );

          return Column(
            children: [
              // accountName
              Row(
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
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              // accuountNumber
              Row(
                children: [
                  Text(
                    S.of(context).accountNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Expanded(child: Text('')),
                  Text(
                    bankInfo.accountNumber.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ThemeSelector.colors.secondaryTant),
                  ),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              // currency
              Row(
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
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              // iban
              Row(
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
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              // swiftCode
              Row(
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
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              // branchAddress
              Row(
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
              ),
            ],
          );
        });
  }
}

void showBankInfoEdit(BuildContext context, {String id = ''}) {
  showAlertDialog(
      context: context,
      title: Container(),
      content: BankInfoForm(id: id),
      actionWidgets: [const BankInfoFormSubmitButtons()]);
}
