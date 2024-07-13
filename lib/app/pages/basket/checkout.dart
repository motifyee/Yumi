import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/basket/widgets/payment_summary_card.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_form_field.dart';

@RoutePage()
class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});

  PaymentOption _option = PaymentOption.visa;
  TextEditingController voucherController = TextEditingController();

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
        title: Column(
          children: [
            Text(
              S.of(context).checkout,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: ThemeSelector.fonts.font_16,
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
          padding: EdgeInsets.symmetric(horizontal: ThemeSelector.statics.defaultTitleGap),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                        Text(
                          S.of(context).payWith,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontSize: ThemeSelector.fonts.font_18,
                              ),
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                        GestureDetector(
                          onTap: () {
                            _option = PaymentOption.visa;
                            context.router.push(const PaymentVisaRoute());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: ThemeSelector.statics.defaultInputGap),
                            child: Row(
                              children: [
                                Container(
                                  width: ThemeSelector.statics.defaultLineGap,
                                  height: ThemeSelector.statics.defaultLineGap,
                                  decoration: BoxDecoration(color: _option == PaymentOption.visa ? ThemeSelector.colors.primary : ThemeSelector.colors.secondaryFaint, borderRadius: BorderRadius.circular(ThemeSelector.statics.defaultLineGap)),
                                ),
                                SizedBox(width: ThemeSelector.statics.defaultGap),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.addVisaCardIcon,
                                      height: ThemeSelector.fonts.font_12,
                                    ),
                                    const Text(' '),
                                    Text(
                                      S.of(context).debitCreditCard,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                        GestureDetector(
                          onTap: () {
                            _option = PaymentOption.wallet;
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: ThemeSelector.statics.defaultInputGap),
                            child: Row(
                              children: [
                                Container(
                                  width: ThemeSelector.statics.defaultLineGap,
                                  height: ThemeSelector.statics.defaultLineGap,
                                  decoration: BoxDecoration(color: _option == PaymentOption.wallet ? ThemeSelector.colors.primary : ThemeSelector.colors.secondaryFaint, borderRadius: BorderRadius.circular(ThemeSelector.statics.defaultLineGap)),
                                ),
                                SizedBox(width: ThemeSelector.statics.defaultGap),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.scheduleMenuIcon,
                                      height: ThemeSelector.fonts.font_12,
                                    ),
                                    const Text(' '),
                                    Text(
                                      S.of(context).wallet,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).saveOnYourOrder,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: ThemeSelector.fonts.font_18,
                              ),
                        ),
                        TextFormFieldTemplate(
                          controller: voucherController,
                          borderStyle: TextFormFieldBorderStyle.borderedRound,
                          hintText: S.of(context).enterVoucherCode,
                          prefixIcon: Container(
                            padding: EdgeInsets.all(ThemeSelector.statics.defaultInputGap),
                            child: SvgPicture.asset(AppAssets.voucherIcon),
                          ),
                          suffixIcon: TextButton(
                            onPressed: () {
                              if (voucherController.value.text.isNotEmpty) context.read<BasketCubit>().addVoucher(voucher: voucherController.value.text);
                            },
                            child: Text(
                              S.of(context).submit,
                              style: TextStyle(
                                color: ThemeSelector.colors.secondaryTantLighter,
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
                                      context.read<BasketCubit>().stripePayment();
                                      // context.read<BasketCubit>().closeBasket();
                                    },
                                    child: Container(
                                      width: ThemeSelector.statics.defaultGapXXXL * 1.5,
                                      height: ThemeSelector.statics.defaultTitleGapLarge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(ThemeSelector.statics.defaultBorderRadius),
                                        color: ThemeSelector.colors.primary,
                                      ),
                                      child: Center(
                                        child: Text(
                                          S.of(context).placeOrder,
                                          style: Theme.of(context).textTheme.displaySmall,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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

enum PaymentOption { visa, wallet, paypal }
