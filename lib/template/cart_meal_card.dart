import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';
import 'package:yumi/template/text_form_field.dart';

class CartMealCard extends StatelessWidget {
  const CartMealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ThemeSelector.statics.defaultGap),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          boxShadow: [
            BoxShadow(
                color: ThemeSelector.colors.shadow.withOpacity(.05),
                blurRadius: 2,
                offset: Offset(0, 3))
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultTitleGap,
              vertical: ThemeSelector.statics.defaultLineGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pumpkin Soup',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: ThemeSelector.fonts.font_18,
                                  ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: ThemeSelector.statics.defaultGapExtreme,
                              child: TextCurrency(
                                value: 0.65,
                                fontSize: ThemeSelector.fonts.font_14,
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(30, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: Text(
                                  '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                )),
                            SizedBox(
                              width: ThemeSelector.statics.defaultTitleGapLarge,
                              child: TextFormFieldTemplate(
                                isDense: true,
                                borderStyle:
                                    TextFormFieldBorderStyle.borderNone,
                                initialValue: 1,
                                textInputType: TextInputType.number,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(30, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: Text(
                                  '+',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: ThemeSelector.statics.defaultGapXXL,
                    height: ThemeSelector.statics.defaultGapXXL,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadius),
                    ),
                    child: Image.asset(
                      'assets/images/354.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Text(
                S.of(context).specialRequest,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: ThemeSelector.statics.defaultLineGap),
              TextFormFieldTemplate(
                isDense: true,
                borderStyle: TextFormFieldBorderStyle.borderNone,
                hintText: S.of(context).anythingElseWeNeedToKnow,
                label: S.of(context).addANote,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
