import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/basket/widgets/payment_summary_card.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/routes/routes.gr.dart';

@RoutePage()
class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});

  TextEditingController voucherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<WalletCubit>().getWallet();

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
            color: CommonColors.primary,
          ),
        ),
        title: Column(
          children: [
            Text(
              S.of(context).checkout,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: CommonFontSize.font_16,
                  ),
            ),
            Text(
              context.read<UserCubit>().state.address?.addressTitle ?? '',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimens.defaultTitleGap,
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BlocBuilder<BasketCubit, BasketState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: CommonDimens.defaultBlockGap,
                            ),
                            Text(
                              S.of(context).payWith,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    fontSize: CommonFontSize.font_18,
                                  ),
                            ),
                            const SizedBox(height: CommonDimens.defaultGap),
                            GestureDetector(
                              onTap: () {
                                context.read<BasketCubit>().updatePayment(
                                      paymentType: PaymentOption.visa.index,
                                    );
                                return;
                                context.router.push(const PaymentVisaRoute());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: CommonDimens.defaultInputGap,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: CommonDimens.defaultLineGap,
                                      height: CommonDimens.defaultLineGap,
                                      decoration: BoxDecoration(
                                        color:
                                            state.basket.invoice.paymentType ==
                                                    PaymentOption.visa.index
                                                ? CommonColors.primary
                                                : CommonColors.secondaryFaint,
                                        borderRadius: BorderRadius.circular(
                                          CommonDimens.defaultLineGap,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: CommonDimens.defaultGap,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.addVisaCardIcon,
                                          height: CommonFontSize.font_12,
                                        ),
                                        const Text(' '),
                                        Text(
                                          S.of(context).debitCreditCard,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: CommonDimens.defaultGap),
                            GestureDetector(
                              onTap: () {
                                context.read<BasketCubit>().updatePayment(
                                      paymentType: PaymentOption.wallet.index,
                                    );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: CommonDimens.defaultInputGap,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: CommonDimens.defaultLineGap,
                                      height: CommonDimens.defaultLineGap,
                                      decoration: BoxDecoration(
                                        color:
                                            state.basket.invoice.paymentType ==
                                                    PaymentOption.wallet.index
                                                ? CommonColors.primary
                                                : CommonColors.secondaryFaint,
                                        borderRadius: BorderRadius.circular(
                                          CommonDimens.defaultLineGap,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: CommonDimens.defaultGap,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.scheduleMenuIcon,
                                          height: CommonFontSize.font_12,
                                        ),
                                        const Text(' '),
                                        Text(
                                          S.of(context).wallet,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    const Expanded(child: SizedBox.shrink()),
                                    BlocBuilder<WalletCubit, WalletState>(
                                      builder: (context, state) {
                                        return state.isLoading
                                            ? const PacmanLoadingWidget(
                                                size: CommonDimens
                                                    .defaultBlockGap,
                                              )
                                            : TextCurrency(
                                                value: -1 *
                                                    (state.wallet.money ?? 0),
                                                fontSize:
                                                    CommonFontSize.font_14,
                                              );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: CommonDimens.defaultGap),
                          ],
                        );
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).saveOnYourOrder,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: CommonFontSize.font_18,
                                  ),
                        ),
                        TextFormFieldTemplate(
                          controller: voucherController,
                          borderStyle: TextFormFieldBorderStyle.borderedRound,
                          hintText: S.of(context).enterVoucherCode,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(
                              CommonDimens.defaultInputGap,
                            ),
                            child: SvgPicture.asset(AppAssets.voucherIcon),
                          ),
                          suffixIcon: TextButton(
                            onPressed: () {
                              if (voucherController.value.text.isNotEmpty) {
                                context.read<BasketCubit>().addVoucher(
                                      voucher: voucherController.value.text,
                                    );
                              }
                            },
                            child: Text(
                              S.of(context).submit,
                              style: TextStyle(
                                color: CommonColors.secondaryTantLighter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaymentSummaryCard(),
                        if (false)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).disclaimer,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: 'ConfirmBasketSeries',
                              child: BlocConsumer<BasketCubit, BasketState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (state.basket.invoice.paymentType ==
                                          PaymentOption.visa.index) {
                                        context
                                            .read<BasketCubit>()
                                            .stripePayment();
                                      }
                                      if (state.basket.invoice.paymentType ==
                                          PaymentOption.wallet.index) {
                                        context
                                            .read<BasketCubit>()
                                            .closeBasket();
                                      }
                                    },
                                    child: Container(
                                      width: CommonDimens.defaultGapXXXL * 1.5,
                                      height: CommonDimens.defaultTitleGapLarge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          CommonDimens.defaultBorderRadius,
                                        ),
                                        color: CommonColors.primary,
                                      ),
                                      child: Center(
                                        child: state.basket.isPaying
                                            ? PacmanLoadingWidget(
                                                color: CommonColors.onPrimary,
                                                size: CommonFontSize.font_24,
                                              )
                                            : Text(
                                                S.of(context).checkout,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                              ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: CommonDimens.defaultBlockGap),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
