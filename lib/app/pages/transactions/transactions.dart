import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/transactions/transaction_cubit/transaction_cubit.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

@RoutePage()
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: TextButton(
                onPressed: () {
                  G().router.pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: CommonColors.primary,
                )),
            title: Text(
              S.of(context).transactions,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultLineGap),
                child: Row(
                  children: [
                    SvgPicture.asset(
                        'assets/images/transaction_wallet_icon.svg'),
                    const Text('  '),
                    Text(
                      S.of(context).transactions,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: CommonDimens.defaultGap),
              Expanded(
                child: PaginationTemplate(
                  scrollDirection: Axis.vertical,
                  loadDate: () {
                    context.read<TransactionCubit>().getAllTransactions(
                        userId: context.read<UserCubit>().state.user.id);
                  },
                  child: BlocBuilder<TransactionCubit, TransactionState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          for (Transaction transaction in state.pagination.data)
                            if (transaction.credit != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: CommonDimens.defaultGap,
                                    horizontal: CommonDimens.defaultGap),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: CommonColors.backgroundTant),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            CommonDimens.defaultBlockGap,
                                        vertical: CommonDimens.defaultLineGap),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  transaction.journalType ?? '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              Text('- ${transaction.guid}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                            ],
                                          ),
                                        ),
                                        TextCurrency(
                                          prefix: transaction.debit! > 0
                                              ? null
                                              : ' - ',
                                          value: transaction.debit! > 0
                                              ? transaction.debit!
                                              : transaction.credit!,
                                          fontSize: CommonFontSize.font_12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          if (state.pagination.isLoading)
                            const PacmanLoadingWidget(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
