import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/calener.dart';
import 'package:yumi/template/text_form_field.dart';

class CustomerPreOrderForm extends StatelessWidget {
  const CustomerPreOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ThemeSelector.statics.defaultBlockGap,
        right: ThemeSelector.statics.defaultBlockGap,
        top: ThemeSelector.statics.defaultGapExtreme,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtreme),
            topLeft: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtreme),
          )),
      width: MediaQuery.of(context).size.width,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          children: [
            Text(
              S.of(context).preOrder,
              style: TextStyle(
                color: ThemeSelector.colors.secondary,
                fontSize: ThemeSelector.fonts.font_14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Row(
              children: [
                Text(
                  'Hi Ayman',
                  style: TextStyle(
                    color: ThemeSelector.colors.primary,
                    fontSize: ThemeSelector.fonts.font_16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${S.of(context).pleaseSpecifyTheDayTimeOfDelivery}:',
                  style: TextStyle(
                    color: ThemeSelector.colors.secondary,
                    fontSize: ThemeSelector.fonts.font_12,
                  ),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Row(
              children: [
                SizedBox(
                  width: ThemeSelector.statics.defaultGapExtreme,
                  child: Text(
                    '${S.of(context).day}:',
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_14,
                    ),
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                SizedBox(
                  width: ThemeSelector.statics.defaultGapXXXL,
                  child: TextFormFieldTemplate(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) => const Dialog(
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          child: Calendar(),
                        ),
                      );
                    },
                    readOnly: true,
                    hintText: S.of(context).deliveryDay,
                    borderStyle: TextFormFieldBorderStyle.borderedRound,
                  ),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultMicroGap),
            Row(
              children: [
                SizedBox(
                  width: ThemeSelector.statics.defaultGapExtreme,
                  child: Text(
                    '${S.of(context).time}:',
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_14,
                    ),
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                SizedBox(
                  width: ThemeSelector.statics.defaultGapXXXL,
                  child: TextFormFieldTemplate(
                    hintText: S.of(context).deliveryTime,
                    textInputType: TextInputType.number,
                    borderStyle: TextFormFieldBorderStyle.borderedRound,
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                GestureDetector(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultMicroGap),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.primary,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusSmall)),
                  child: Text(
                    S.of(context).pm,
                    style: TextStyle(color: ThemeSelector.colors.onPrimary),
                  ),
                )),
                SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                GestureDetector(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultMicroGap),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.primary,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusSmall)),
                  child: Text(
                    S.of(context).am,
                    style: TextStyle(color: ThemeSelector.colors.onPrimary),
                  ),
                )),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
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
                        style: TextStyle(
                          color: ThemeSelector.colors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                GestureDetector(
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
                        S.of(context).continue0,
                        style: TextStyle(
                          color: ThemeSelector.colors.onPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
