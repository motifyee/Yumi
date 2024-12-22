import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/components/login_to_continue/login_to_continue.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';

@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final walletWidget = Expanded(
          child: PaginationTemplate(
            scrollDirection: Axis.vertical,
            loadDate: () {
              context.read<WalletCubit>().getWallet();
            },
            child: BlocBuilder<WalletCubit, WalletState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.isLoading) const PacmanLoadingWidget(),
                    if (!state.isLoading)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: CommonDimens.defaultGap,
                          horizontal: CommonDimens.defaultGap,
                        ),
                        child: Container(
                          decoration:
                              BoxDecoration(color: CommonColors.backgroundTant),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultBlockGap,
                              vertical: CommonDimens.defaultLineGap,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).youHave,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      TextCurrency(
                                        value: (G().isCustomerApp ? -1 : 1) *
                                            (state.wallet.money ?? 0),
                                        fontSize: CommonFontSize.font_20,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.router
                                        .push(const PaymentVisaRoute());
                                  },
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/visa_card_icon.svg',
                                      ),
                                      Text(
                                        S.of(context).cards,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                    ],
                                  ),
                                ),
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
        );

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: TextButton(
              onPressed: () {
                G().router.maybePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: CommonColors.primary,
              ),
            ),
            title: Text(
              S.of(context).wallet,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.defaultLineGap,
                ),
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
              const SizedBox(height: CommonDimens.defaultGap),
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return state.isLoggedIn
                      ? walletWidget
                      : const LoginToContinue();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
