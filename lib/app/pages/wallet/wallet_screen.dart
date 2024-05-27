import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_currency.dart';

@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
            S.of(context).wallet,
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
                  SvgPicture.asset('assets/images/schedule_menu.svg'),
                  const Text('  '),
                  Text(
                    S.of(context).yourWallet,
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
                  context.read<WalletCubit>().getWallet();
                },
                child: BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        if (state.isLoading) Loading(),
                        if (!state.isLoading)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ThemeSelector.statics.defaultGap,
                                horizontal: ThemeSelector.statics.defaultGap),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ThemeSelector.colors.backgroundTant),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ThemeSelector.statics.defaultBlockGap,
                                    vertical:
                                        ThemeSelector.statics.defaultLineGap),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(S.of(context).youHave,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                          TextCurrency(
                                            value: state.wallet.money ?? 0,
                                            fontSize:
                                                ThemeSelector.fonts.font_20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.router.push(const PaymentVisaRoute());
                                      },
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/visa_card_icon.svg'),
                                          Text(
                                            S.of(context).cards,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
