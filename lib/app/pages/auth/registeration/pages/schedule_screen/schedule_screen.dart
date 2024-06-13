import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/domain/schedule/entities/extensions.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/screen_container.dart';

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
          appBar: G.rd<RegCubit>().state.registerationStarted
              ? null
              : AppBar(
                  backgroundColor: Colors.transparent,
                  bottomOpacity: 0,
                  scrolledUnderElevation: 0,
                  iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
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
                  Expanded(child: SingleChildScrollView(child: _cards(state))),
                  Container(
                    // color: Colors.green,
                    padding: const EdgeInsets.all(16.0),
                    child: _saveButton(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  TextButton _saveButton(BuildContext context) {
    var bloc = context.read<ScheduleCubit>();
    var valid = bloc.state.scheduleForm.uiValid;
    var validSchedule = bloc.state.scheduleForm.validSchedule;

    var enableUpdate = valid && bloc.state.changed;

    return TextButton(
      onPressed: () {
        if (!enableUpdate) return;
        if (!validSchedule) return addYourScheduleDialog(context);

        // bloc.add(const ScheduleEvent.saveSchedule());
        bloc.updateSchedule();
      },
      child: Container(
        width: 125,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(ThemeSelector.statics.defaultBorderRadiusLarge)),
          color: enableUpdate
              ? ThemeSelector.colors.primary
              : ThemeSelector.colors.primaryTant,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.save,
              color: ThemeSelector.colors.onSecondary,
            ),
            Text(
              'Save',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }

  Wrap _cards(ScheduleState state) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: [
        const SizedBox(width: double.infinity, height: 50),
        ...WeekDay.values
            .map((e) => [
                  _card(state.scheduleForm.scheduleDay(e)),
                  const SizedBox(
                    height: 10,
                  )
                ])
            .expand((e) => e),
      ],
    );
  }

  Widget _card(ScheduleDay day) {
    return Card(
        shape: day.uiValid
            ? null
            : RoundedRectangleBorder(
                side: BorderSide(color: ThemeSelector.colors.error, width: 2.0),
                borderRadius: BorderRadius.circular(10.0)),
        borderOnForeground: true,
        elevation: day.active ?? false ? 5 : 1,
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              _title(day),
              const SizedBox(height: 10),
              _body(day),
            ],
          ),
        ));
  }

  Widget _title(ScheduleDay day) {
    return Builder(builder: (context) {
      return Card(
        borderOnForeground: true,
        // elevation: 2,
        color: day.active ?? false
            ? ThemeSelector.colors.primary
            : ThemeSelector.colors.primaryTant,
        margin: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Builder(
          builder: (context) {
            return SizedBox(
              width: double.infinity,
              height: 40,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: InkWell(
                      onTap: () {
                        var d = day.copyWith(active: !(day.active ?? false));
                        HapticFeedback.lightImpact();
                        context.read<ScheduleCubit>().saveScheduleDay(d);
                      },
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          day.name?.apprev ?? "*DAY",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: day.active ?? false
                                ? Colors.white
                                : ThemeSelector.colors.secondaryTantLighter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (day.valid && (day.active ?? false))
                    BlocBuilder<ScheduleCubit, ScheduleState>(
                      builder: (context, state) {
                        if (state.scheduleForm.activeDays.length < 2) {
                          return const SizedBox();
                        }

                        return Positioned(
                          right: 0,
                          child: MenuAnchor(
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
                                child: const Text("Copy to all"),
                                onPressed: () {
                                  G.rd<ScheduleCubit>().applyDayToAll(day);
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            );
          },
        ),
      );
    });
  }

  Widget _body(ScheduleDay day) {
    final activeTime = day.activeTime?.toPaddedString;
    final timeDiff = (activeTime?.contains('-') ?? true) ? "00:00" : activeTime;

    return Builder(builder: (context) {
      return Column(
        children: [
          _timeRow(day, true),
          _timeRow(day, false),
          const SizedBox(height: 5),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Text(
                timeDiff ?? "00:00",
                style: TextStyle(
                    color: day.active ?? false
                        ? ThemeSelector.colors.secondaryTant
                        : ThemeSelector.colors.secondaryFaint),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }

  Widget _timeRow(ScheduleDay day, bool start) {
    return Builder(builder: (context) {
      final themeData = Theme.of(context);
      final textTheme = themeData.textTheme;
      return Theme(
        data: themeData.copyWith(
            textTheme: textTheme.copyWith(
          headlineSmall: TextStyle(
            color: ThemeSelector.colors.primary,
            fontSize: ThemeSelector.fonts.font_9,
          ),
        )),
        child: InkWell(
          onTap: day.active ?? false
              ? () async {
                  HapticFeedback.lightImpact();

                  await showTimePicker(
                    context: context,
                    initialTime:
                        (start ? day.start : day.end) ?? TimeOfDay.now(),

                    helpText: 'Pick ${start ? "Start" : "End"} Time',
                    initialEntryMode: TimePickerEntryMode.dialOnly,
                    // builder: (context, child) {
                    //   return MediaQuery(
                    //     data: MediaQuery.of(context).copyWith(
                    //       alwaysUse24HourFormat: false,
                    //     ),
                    //     child: ChildDataNotifier(
                    //       builder: (context, data, notifier) {
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //             border: Border.all(color: Colors.red, width: 5),
                    //           ),
                    //           child: Center(
                    //             child: TextButton(
                    //               onPressed: () => G.pop(),
                    //               child: child ??
                    //                   Icon(
                    //                     Icons.warning,
                    //                     size: 32,
                    //                     color: Colors.yellow.shade800,
                    //                   ),
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   );
                    // },
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
                        G.hideSnackbar();
                        G.snackBar(
                          "Start time must be at least 2 hours before end time",
                        );
                      }
                    }

                    if (!start) {
                      if (tod.minutesDifference(saved?.start) < 2 * 60) {
                        G.hideSnackbar();
                        return G.snackBar(
                          "End time must be at least 2 hours after start time",
                        );
                      }
                    }
                    // ---------------------------------------------------------

                    G.hideSnackbar();
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
                    "${start ? 'START' : 'END'} ",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: day.active ?? false
                          ? ThemeSelector.colors.primaryDisabled
                          : ThemeSelector.colors.primaryTant,
                    ),
                  ),
                ),
                _time(day, start),
                const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }

  RichText _time(ScheduleDay day, bool start) {
    var timeOfDay =
        (start ? day.start : day.end) ?? const TimeOfDay(hour: 0, minute: 0);
    var timeParts = [
      (timeOfDay.hour > 12 ? timeOfDay.hour - 12 : timeOfDay.hour).toString(),
      ' : ',
      timeOfDay.minute.toString()
    ].reduce(
      (value, element) => value.padLeft(2, '0') + element.padLeft(2, '0'),
    );

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: ThemeSelector.colors.secondary,
          textBaseline: TextBaseline.alphabetic,
        ),
        children: [
          TextSpan(
            text: timeParts,
            style: TextStyle(
              fontSize: 14,
              color: day.active ?? false
                  ? null
                  : ThemeSelector.colors.secondaryFaint,
              fontWeight: FontWeight.w500,
            ),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0, 0),
              // offset: const Offset(2, -4),
              child: Text(' ${timeOfDay.period.name.toUpperCase()}',
                  textScaler: const TextScaler.linear(0.7),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: day.active ?? false
                        ? ThemeSelector.colors.primaryDisabled.withAlpha(950)
                        : ThemeSelector.colors.secondaryFaint,
                  )),
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
            SvgPicture.asset('assets/images/flow/add-schedule.svg'),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'You should schedule at least two working days with at least two hours each.',
                style: TextStyle(
                  fontSize: ThemeSelector.fonts.font_14,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    actions: {'Next': null},
  );
}

void sheduleDialog(BuildContext context) {
  showAlertDialog(
    context: context,
    // title: Container(),
    content: const MyScheduleScreen(),
    actions: {
      'Next': (ctx) {
        if (!G.rd<ScheduleCubit>().state.schedule.validSchedule) {
          return addYourScheduleDialog(context);
        }

        G.rd<RegCubit>().refresh();

        G.pop();
      },
    },
    insetPadding: 0,
  );
}

double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
  final width = MediaQuery.of(context).size.width;
  double val = (width / 1400) * maxTextScaleFactor;
  return max(1, min(val, maxTextScaleFactor));
}
