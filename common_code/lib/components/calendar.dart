import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:common_code/resources/common_colors.dart';
import 'package:common_code/resources/common_dimens.dart';
import 'package:common_code/resources/common_font_size.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  Calendar(
      {super.key,
      this.onValueChanged,
      this.currentDate,
      this.firstDate,
      this.lastDate});

  void Function(List<DateTime?>)? onValueChanged;
  DateTime? currentDate;
  DateTime? firstDate;
  DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        vertical: CommonDimens.defaultLineGap,
        horizontal: CommonDimens.defaultGap,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CommonDimens.buttonBorderRadius),
        color: CommonColors.background,
        boxShadow: [BoxShadow(color: CommonColors.shadow, blurRadius: 100)],
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          controlsTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: CommonFontSize.font_20,
              ),
          dayTextStyle: Theme.of(context).textTheme.bodyLarge,
          weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
          weekdayLabelTextStyle: Theme.of(context).textTheme.labelLarge,
          currentDate: currentDate,
          firstDate: firstDate,
          lastDate: lastDate,
          dayBuilder: (
              {required DateTime date,
              BoxDecoration? decoration,
              bool? isDisabled,
              bool? isSelected,
              bool? isToday,
              TextStyle? textStyle}) {
            return Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: CommonColors.secondaryFaint, width: 1)),
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
        onValueChanged: onValueChanged,
        value: const [],
      ),
    );
  }
}
