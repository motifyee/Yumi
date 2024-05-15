import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/transactions/transaction_cubit/transaction_cubit.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_currency.dart';

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
                  context.router.maybePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: ThemeSelector.colors.primary,
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
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultLineGap),
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
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Expanded(
                child: PaginationTemplate(
                  scrollDirection: Axis.vertical,
                  loadDate: () {
                    context.read<TransactionCubit>().getAllTransactions(
                        userId: context.read<UserBloc>().state.user.id);
                  },
                  child: BlocBuilder<TransactionCubit, TransactionState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          for (Transaction transaction
                              in state.paginationHelper.data)
                            if (transaction.credit != null)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ThemeSelector.statics.defaultGap,
                                    horizontal:
                                        ThemeSelector.statics.defaultGap),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          ThemeSelector.colors.backgroundTant),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ThemeSelector
                                            .statics.defaultBlockGap,
                                        vertical: ThemeSelector
                                            .statics.defaultLineGap),
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
                                          fontSize: ThemeSelector.fonts.font_12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          if (state.paginationHelper.isLoading) Loading(),
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
