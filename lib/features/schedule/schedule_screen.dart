import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/driver/driver_reg_cubit.dart';
import 'package:yumi/features/chef_application/bloc.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/model/extensions.dart';
import 'package:yumi/features/schedule/model/model.dart';
import 'package:yumi/features/schedule/repository/mock.dart';
import 'package:yumi/features/schedule/repository/repository.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class MyScheduleScreen extends StatelessWidget {
  const MyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (context.read<ChefFlowBloc>().state.started &&
          !G.read<ScheduleBloc>().state.schedule.hasScheduledDays) {
        addYourScheduleDialog(context);
      }
    });

    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
        ),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (state.status.isInit) {
              context.read<ScheduleBloc>().add(const ScheduleEvent.init());
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
    );
  }

  TextButton _saveButton(BuildContext context) {
    var bloc = context.read<ScheduleBloc>();
    var valid = bloc.state.scheduleForm.uiValid;
    var canUpdate = valid && bloc.state.changed;

    return TextButton(
      onPressed: () {
        if (!canUpdate) return;

        bloc.add(const ScheduleEvent.saveSchedule());
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
          color: canUpdate
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
            return InkWell(
              onTap: () {
                var d = day.copyWith(active: !(day.active ?? false));
                HapticFeedback.lightImpact();
                context
                    .read<ScheduleBloc>()
                    .add(ScheduleEvent.saveScheduleDay(context, d));
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(
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
            );
          },
        ),
      );
    });
  }

  Widget _body(ScheduleDay day) {
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
                day.activeTime?.toStringD ?? "00:00",
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
                  ).then((tod) {
                    if (tod == null) return;
                    HapticFeedback.lightImpact();

                    context
                        .read<ScheduleBloc>()
                        .add(ScheduleEvent.saveScheduleDay(
                            context,
                            day.copyWith(
                              start: start ? tod : day.start,
                              end: start ? day.end : tod,
                            )));
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
        if (!G.read<ScheduleBloc>().state.schedule.validSchedule) {
          return addYourScheduleDialog(context);
        }

        G.rd<RegCubit>().refresh();

        // Navigator.of(context, rootNavigator: true).pop();
        G.pop();
        // G.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: 2));
        // G.cread<RegCubit>().goto(2);
      },
    },
    insetPadding: 0,
  );
}
