import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/basket/widgets/payment_summary_card.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/basket/widgets/custom_switch.dart';
import 'package:yumi/validators/card_number_input_formatter.dart';
import 'package:yumi/validators/expiry_date_input_formatter.dart';

@RoutePage()
class PaymentVisaScreen extends StatelessWidget {
  const PaymentVisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: CommonColors.primary,
            )),
        title: Text(
          S.of(context).addCardDetails,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: CommonFontSize.font_16,
              ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CommonDimens.defaultTitleGap),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/visa_card.svg'),
                      ],
                    ),
                    TextFormFieldTemplate(
                      hintText: S.of(context).cardNumber,
                      borderStyle: TextFormFieldBorderStyle.borderBottom,
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter()
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 10,
                          child: TextFormFieldTemplate(
                            hintText: S.of(context).expiryDateMMYY,
                            borderStyle: TextFormFieldBorderStyle.borderBottom,
                            textInputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              ExpiryDateInputFormatter()
                            ],
                          ),
                        ),
                        const SizedBox(width: CommonDimens.defaultGap),
                        Flexible(
                          flex: 7,
                          child: TextFormFieldTemplate(
                            hintText: S.of(context).securityCode,
                            borderStyle: TextFormFieldBorderStyle.borderBottom,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: CommonDimens.defaultGap),
                              child: SvgPicture.asset(
                                'assets/images/visa_card_icon.svg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                                maxWidth: CommonDimens.iconSizeSmall),
                            textInputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        S.of(context).saveCreditCardDetails,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: CustomSwitch(
                        isSelected: false,
                      ),
                    ),
                    const SizedBox(height: CommonDimens.defaultBlockGap),
                    PaymentSummaryCard(
                      hideTitle: true,
                      hideHint: true,
                    ),
                    const SizedBox(height: CommonDimens.defaultBlockGap),
                    Text(
                      S.of(context).securePaymentWithSSLEncryptionInfo,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Expanded(child: Text('')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.router.pop();
                          },
                          child: Container(
                            width: CommonDimens.defaultGapXXXL,
                            height: CommonDimens.defaultTitleGapLarge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    CommonDimens.defaultBorderRadius),
                                border: Border.all(
                                    color: CommonColors.primary, width: 1)),
                            child: Center(
                              child: Text(
                                S.of(context).cancel,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: CommonDimens.defaultGap),
                        Hero(
                          tag: 'ConfirmBasketSeries',
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: CommonDimens.defaultGapXXXL,
                              height: CommonDimens.defaultTitleGapLarge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    CommonDimens.defaultBorderRadius),
                                color: CommonColors.primary,
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).pay,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: CommonDimens.defaultBlockGap),
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
