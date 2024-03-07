import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/card_number_input_formatter.dart';
import 'package:yumi/validators/expiry_date_input_formatter.dart';

@RoutePage()
class PaymentVisa extends StatelessWidget {
  PaymentVisa({super.key});

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
              color: ThemeSelector.colors.primary,
            )),
        title: Text(
          S.of(context).addCardDetails,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: ThemeSelector.fonts.font_16,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.defaultTitleGap),
        child: Column(
          children: [
            Expanded(
              child: Column(
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
                  TextFormFieldTemplate(
                    hintText: S.of(context).expiryDateMMYY,
                    borderStyle: TextFormFieldBorderStyle.borderBottom,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateInputFormatter()
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                    width: ThemeSelector.statics.defaultGapXXXL,
                    height: ThemeSelector.statics.defaultTitleGapLarge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultBorderRadius),
                        border: Border.all(
                            color: ThemeSelector.colors.primary, width: 1)),
                    child: Center(
                      child: Text(
                        S.of(context).cancel,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                Hero(
                  tag: 'ConfirmCartSeries',
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: ThemeSelector.statics.defaultGapXXXL,
                      height: ThemeSelector.statics.defaultTitleGapLarge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultBorderRadius),
                        color: ThemeSelector.colors.primary,
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).pay,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
          ],
        ),
      ),
    );
  }
}
