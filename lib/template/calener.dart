import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: ThemeSelector.statics.defaultLineGap,
        horizontal: ThemeSelector.statics.defaultGap,
      ),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(ThemeSelector.statics.buttonBorderRadius),
        color: ThemeSelector.colors.background,
        boxShadow: [
          BoxShadow(color: ThemeSelector.colors.shadow, blurRadius: 100)
        ],
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          controlsTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: ThemeSelector.fonts.font_20,
              ),
          dayTextStyle: Theme.of(context).textTheme.bodyLarge,
          weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
          dayBuilder: (
              {required DateTime date,
              BoxDecoration? decoration,
              bool? isDisabled,
              bool? isSelected,
              bool? isToday,
              TextStyle? textStyle}) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ThemeSelector.colors.secondaryFaint, width: 1)),
              child: Container(
                  decoration: decoration,
                  child: Center(
                      child: Text(
                    date.day.toString(),
                    style: textStyle,
                  ))),
            );
          },
        ),
        value: [],
      ),
    );
  }
}
