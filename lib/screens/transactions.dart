import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_currency.dart';

@RoutePage()
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: TextButton(
            onPressed: () {
              context.router.popForced();
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
                SvgPicture.asset('assets/images/transaction_wallet_icon.svg'),
                Text('  '),
                Text(
                  S.of(context).transactions,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: PaginationTemplate(
              scrollDirection: Axis.vertical,
              loadDate: () {},
              child: Column(
                children: [
                  for (var i in [
                    0,
                    1,
                    2,
                    34,
                    5,
                    6,
                    8,
                    7,
                    5,
                    5,
                    7,
                    5,
                    5,
                    5,
                    52,
                    5,
                    85,
                    65,
                    5,
                    5,
                    9,
                    5,
                    5,
                    5,
                    4
                  ])
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ThemeSelector.statics.defaultGap,
                          horizontal: ThemeSelector.statics.defaultGap),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ThemeSelector.colors.backgroundTant),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultBlockGap,
                              vertical: ThemeSelector.statics.defaultLineGap),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Paid From Wallet For Order #Yumi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    Text('- 1301',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ),
                              TextCurrency(
                                prefix: ' - ',
                                value: 5.4,
                                fontSize: ThemeSelector.fonts.font_12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
