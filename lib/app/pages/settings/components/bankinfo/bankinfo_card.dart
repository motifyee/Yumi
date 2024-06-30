import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/cubit/bankinfo_cubit.dart';
import 'package:yumi/app/pages/settings/components/bankinfo/bankinfo_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/dialog.dart';

// class BankInfoCardProvider extends StatelessWidget {
//   const BankInfoCardProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<BankInfoCubit>(
//       create: (context) => BankInfoCubit(),
//       child: const BankInfoCard(),
//     );
//   }
// }

class BankInfoCard extends StatelessWidget {
  const BankInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final headerRow = Row(
      children: [
        SvgPicture.asset(
          'assets/images/bank.svg',
          colorFilter:
              ColorFilter.mode(ThemeSelector.colors.secondary, BlendMode.srcIn),
        ),
        SizedBox(width: ThemeSelector.statics.defaultGap),
        Text(S.of(context).bankAccount),
        const Expanded(child: SizedBox()),
        // if (bankInfo.id.isNotEmpty)
        TextButton(
            onPressed: () => showBankInfoForm(context),
            child: Text(
              S.of(context).edit,
              style: Theme.of(context).textTheme.bodyMedium,
            ))
      ],
    );

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
              headerRow,
              SizedBox(height: ThemeSelector.statics.defaultLineGap),
              const BankInfoFields(),
            ],
          ),
        ),
      ),
    );
  }
}

class BankInfoFields extends StatelessWidget {
  const BankInfoFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BankInfoCubit>();
    cubit.getBankInfo();

    return BlocBuilder<BankInfoCubit, BankInfoState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final bankNameRow = Row(
          children: [
            Text(
              S.of(context).bankName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: Text('')),
            Text(
              state.bankInfo.bankName,
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
              state.bankInfo.accountName,
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
              state.bankInfo.accountNumber,
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
              state.bankInfo.currency,
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
              state.bankInfo.iban,
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
              state.bankInfo.swiftCode,
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
              state.bankInfo.branchAddress,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ThemeSelector.colors.secondaryTant),
            ),
          ],
        );

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
      content: const BankInfoForm(),
      actionWidgets: [const BankInfoSubmitButton()]);
}
