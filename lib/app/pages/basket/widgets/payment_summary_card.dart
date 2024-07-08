import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_currency.dart';

class PaymentSummaryCard extends StatelessWidget {
  PaymentSummaryCard({super.key, this.hideTitle, this.hideHint});

  bool? hideTitle;
  bool? hideHint;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Hero(
          tag: 'PaymentSummaryCard',
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hideTitle != true)
                  Text(
                    S.of(context).paymentSummary,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: ThemeSelector.fonts.font_18,
                        ),
                  ),
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).subtotal,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextCurrency(
                      value: state.basket.invoice.totalPrice,
                      fontSize: ThemeSelector.fonts.font_12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).discount,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextCurrency(
                      value: state.basket.invoice.invoiceDiscount,
                      fontSize: ThemeSelector.fonts.font_12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).invoiceTax,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextCurrency(
                      value: state.basket.invoice.invoiceTax,
                      fontSize: ThemeSelector.fonts.font_12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).deliveryFee,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextCurrency(
                      value: state.basket.invoice.deliveryAreaPrice ?? 0.0,
                      fontSize: ThemeSelector.fonts.font_12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).totalAmount,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextCurrency(
                      value: state.basket.invoice.finalPrice ?? 0.0,
                      fontSize: ThemeSelector.fonts.font_14,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                if (hideHint != true)
                  Text(
                    S.of(context).theTotalPriceIncludesTax,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
