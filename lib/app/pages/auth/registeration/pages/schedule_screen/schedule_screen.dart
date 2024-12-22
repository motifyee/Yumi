import 'dart:math';

import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:common_code/domain/schedule/entities/schedule.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:common_code/domain/schedule/entities/extensions.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

@RoutePage()
class MyScheduleScreen extends StatelessWidget {
  const MyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        context.read<ScheduleCubit>().reset();
      },
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: G().rd<RegCubit>().state.registerationStarted
              ? null
              : AppBar(
                  backgroundColor: Colors.transparent,
                  bottomOpacity: 0,
                  scrolledUnderElevation: 0,
                  iconTheme: IconThemeData(color: CommonColors.primary),
                ),
          body: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (context, state) {
              if (state.status.isInit) {
                context.read<ScheduleCubit>().loadSchedule();
              }
              if (state.status.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(child: _buildCards(state)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildSaveButton(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  TextButton _buildSaveButton(BuildContext context) {
    final bloc = context.read<ScheduleCubit>();
    final valid = bloc.state.scheduleForm.uiValid;
    final validSchedule = bloc.state.scheduleForm.validSchedule;

    final enableUpdate = valid && bloc.state.changed;

    return TextButton(
      onPressed: () {
        if (!enableUpdate) return;
        if (!validSchedule) return addYourScheduleDialog(context);
        bloc.updateSchedule();
      },
      child: Container(
        width: 125,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimens.defaultBorderRadiusLarge),
          ),
          color: enableUpdate ? CommonColors.primary : CommonColors.primaryTant,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.save,
              color: CommonColors.onSecondary,
            ),
            Text(
              S.of(context).save,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }

  Wrap _buildCards(ScheduleState state) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: [
        const SizedBox(width: double.infinity, height: 50),
        ...ScheduleWeekDay.values
            .map(
              (e) => [
                _buildCard(state.scheduleForm.scheduleDay(e)),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
            .expand((e) => e),
      ],
    );
  }

  Widget _buildCard(ScheduleDay day) {
    return Card(
      shape: day.uiValid
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(color: CommonColors.error, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
      borderOnForeground: true,
      elevation: day.active ?? false ? 5 : 1,
      child: SizedBox(
        width: 140,
        child: Column(
          children: [
            _buildCardTitle(day),
            const SizedBox(height: 10),
            _buildCardBody(day),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTitle(ScheduleDay day) {
    final titleInkWell = InkWell(
      onTap: () {
        final d = day.copyWith(active: !(day.active ?? false));
        HapticFeedback.lightImpact();
        G().rd<ScheduleCubit>().saveScheduleDay(d);
      },
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          // day.name?.apprev ?? "*DAY",
          S.current.getProp('${day.name?.name}Prev'),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: day.active ?? false
                ? Colors.white
                : CommonColors.secondaryTantLighter,
          ),
        ),
      ),
    );

    final menu = MenuAnchor(
      builder: (context, ctrl, child) {
        return IconButton(
          onPressed: () {
            if (ctrl.isOpen) return ctrl.close();
            ctrl.open();
          },
          icon: const Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          child: const Text('Copy to all'),
          onPressed: () {
            G().rd<ScheduleCubit>().applyDayToAll(day);
          },
        ),
      ],
    );

    return Card(
      borderOnForeground: true,
      color:
          day.active ?? false ? CommonColors.primary : CommonColors.primaryTant,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Stack(
          children: [
            Positioned.fill(
              child: titleInkWell,
            ),
            if (day.valid && (day.active ?? false))
              BlocBuilder<ScheduleCubit, ScheduleState>(
                builder: (context, state) {
                  if (state.scheduleForm.activeDays.length < 2) {
                    return const SizedBox();
                  }

                  return Positioned(right: 0, child: menu);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardBody(ScheduleDay day) {
    final activeTime = day.activeTime?.toPaddedString;
    final timeDiff = (activeTime?.contains('-') ?? true) ? '00:00' : activeTime;

    return Builder(
      builder: (context) {
        return Column(
          children: [
            _buildTimeRow(day, true),
            _buildTimeRow(day, false),
            const SizedBox(height: 5),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Text(
                  timeDiff ?? '00:00',
                  style: TextStyle(
                    color: day.active ?? false
                        ? CommonColors.secondaryTant
                        : CommonColors.secondaryFaint,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _buildTimeRow(ScheduleDay day, bool start) {
    return Builder(
      builder: (context) {
        final themeData = Theme.of(context);
        final textTheme = themeData.textTheme;
        return Theme(
          data: themeData.copyWith(
            textTheme: textTheme.copyWith(
              headlineSmall: TextStyle(
                color: CommonColors.primary,
                fontSize: CommonFontSize.font_9,
              ),
            ),
          ),
          child: InkWell(
            onTap: day.active ?? false
                ? () async {
                    HapticFeedback.lightImpact();

                    await showTimePicker(
                      context: context,
                      initialTime:
                          (start ? day.start : day.end) ?? TimeOfDay.now(),
                      helpText: start
                          ? S.of(context).pickStartTime
                          : S.of(context).pickEndTime,
                      initialEntryMode: TimePickerEntryMode.dialOnly,
                      barrierDismissible: false,
                      useRootNavigator: true,
                    ).then((tod) {
                      final cubit = context.read<ScheduleCubit>();
                      if (tod == null) return;

                      // ---------------------------------------------------------
                      // Check if end time is after start time with two hours
                      // ---------------------------------------------------------
                      final saved = cubit.state.scheduleForm.scheduleDays
                          .firstWhereOrNull((e) => e.name == day.name);

                      //// TODO: change [api & Schedule.scheduleDay()] to set unset days to null
                      if (start && saved?.end != null) {
                        if (saved?.end?.hour == 0 && saved?.end?.minute == 0) {
                        } else if ((saved?.end?.minutesDifference(tod) ?? 0) <
                            2 * 60) {
                          G().hideSnackbar();
                          G().snackBar(
                            S
                                .of(context)
                                .startTimeMustBeAtLeast2HoursBeforeEndTime,
                          );
                        }
                      }

                      if (!start) {
                        if (tod.minutesDifference(saved?.start) < 2 * 60) {
                          G().hideSnackbar();
                          return G().snackBar(
                            S
                                .of(context)
                                .endTimeMustBeAtLeast2HoursAfterStartTime,
                          );
                        }
                      }
                      // ---------------------------------------------------------

                      G().hideSnackbar();
                      HapticFeedback.lightImpact();

                      cubit.saveScheduleDay(
                        day.copyWith(
                          start: start ? tod : day.start,
                          end: start ? day.end : tod,
                        ),
                      );
                    });
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${start ? S.of(context).scheduleStart : S.of(context).scheduleEnd} ',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: day.active ?? false
                            ? CommonColors.primaryDisabled
                            : CommonColors.primaryTant,
                      ),
                    ),
                  ),
                  _buildTimeWidget(day, start),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  RichText _buildTimeWidget(ScheduleDay day, bool start) {
    final timeOfDay =
        (start ? day.start : day.end) ?? const TimeOfDay(hour: 0, minute: 0);

    var timeParts = [
      (timeOfDay.hour > 12 ? timeOfDay.hour - 12 : timeOfDay.hour).toString(),
      ' : ',
      timeOfDay.minute.toString(),
    ];

    if (CommonLocale.isRTL) timeParts = timeParts.reversed.toList();

    final timeString = timeParts.reduce(
      (value, element) => value.padLeft(2, '0') + element.padLeft(2, '0'),
    );

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: CommonColors.secondary,
          textBaseline: TextBaseline.alphabetic,
        ),
        children: [
          TextSpan(
            text: timeString,
            style: TextStyle(
              fontSize: 14,
              color: day.active ?? false ? null : CommonColors.secondaryFaint,
              fontWeight: FontWeight.w500,
            ),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0, 0),
              // offset: const Offset(2, -4),
              child: Text(
                ' ${timeOfDay.period.name == 'am' ? S.current.am : S.current.pm}',
                textScaler: const TextScaler.linear(0.7),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: day.active ?? false
                      ? CommonColors.primaryDisabled.withAlpha(950)
                      : CommonColors.secondaryFaint,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void addYourScheduleDialog(BuildContext context) {
  showAlertDialog(
    context: context,
    content: SizedBox(
      height: 175,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.addScheduleIcon),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.current
                    .youShouldScheduleAtLeastTwoWorkingDaysWithAtLeastTwoHoursEach,
                style: const TextStyle(
                  fontSize: CommonFontSize.font_14,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    actions: {S.of(context).next: null},
  );
}

void sheduleDialog(BuildContext context) {
  showAlertDialog(
    context: context,
    // title: Container(),
    content: const MyScheduleScreen(),
    actions: {
      S.of(context).next: (ctx) {
        if (!G().rd<ScheduleCubit>().state.schedule.validSchedule) {
          return addYourScheduleDialog(context);
        }

        G().rd<RegCubit>().refresh();

        G().pop();
      },
    },
    insetPadding: 0,
  );
}

double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
  final width = MediaQuery.of(context).size.width;
  final double val = (width / 1400) * maxTextScaleFactor;
  return max(1, min(val, maxTextScaleFactor));
}

extension _SX on S {
  String getProp(String key) =>
      <String, String>{
        'pm': S.current.pm,
        'am': S.current.am,
        'saturdayPrev': S.current.saturdayPrev,
        'sundayPrev': S.current.sundayPrev,
        'mondayPrev': S.current.mondayPrev,
        'tuesdayPrev': S.current.tuesdayPrev,
        'wednesdayPrev': S.current.wednesdayPrev,
        'thursdayPrev': S.current.thursdayPrev,
        'fridayPrev': S.current.fridayPrev,
      }[key] ??
      key;
}
