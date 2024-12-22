import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/basket/widgets/payment_summary_card.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';

@RoutePage()
class PaymentStripeScreen extends StatelessWidget {
  const PaymentStripeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .55,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: CommonDimens.defaultBlockGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: CommonColors.primary,
                  ),
                ),
                Text(
                  S.of(context).payByPaypal,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: CommonFontSize.font_16,
                      ),
                ),
                const TextButton(
                  onPressed: null,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.defaultBlockGap,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TextFormFieldTemplate(
                          hintText: S.of(context).email,
                          borderStyle: TextFormFieldBorderStyle.borderBottom,
                          validators: emailValidator,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: TextFormFieldTemplate(
                                hintText: S.of(context).password,
                                borderStyle:
                                    TextFormFieldBorderStyle.borderBottom,
                                validators: passwordValidator,
                                isPassword: true,
                              ),
                            ),
                            const Flexible(flex: 1, child: Text(' ')),
                          ],
                        ),
                      ],
                    ),
                    PaymentSummaryCard(
                      hideTitle: true,
                      hideHint: true,
                    ),
                    Text(
                      S.of(context).securePaymentWithSSLEncryptionInfo,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
                                CommonDimens.defaultBorderRadius,
                              ),
                              border: Border.all(
                                color: CommonColors.primary,
                                width: 1,
                              ),
                            ),
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
                                  CommonDimens.defaultBorderRadius,
                                ),
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
          ],
        ),
      ),
    );
  }
}
