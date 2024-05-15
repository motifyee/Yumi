import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, required this.isScreen});

  final bool isScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isScreen
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              leading: TextButton(
                  onPressed: () {
                    context.router.popForced();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ThemeSelector.colors.primary,
                  )),
              title: Text(
                S.of(context).notification,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              centerTitle: true,
            ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultLineGap),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/notification.svg'),
                const Text('  '),
                Text(
                  S.of(context).notification,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          BlocProvider(
            create: (context) => NotificationCubit(),
            child: const Expanded(
              child: _NotificationList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList();

  @override
  Widget build(BuildContext context) {
    return PaginationTemplate(
      scrollDirection: Axis.vertical,
      loadDate: () {
        context.read<NotificationCubit>().loadNotification();
      },
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return Column(
            children: [
              for (NotificationS notification in state.pagination.data)
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ThemeSelector.statics.defaultGap,
                        horizontal: ThemeSelector.statics.defaultTitleGap),
                    child: Row(
                      children: [
                        Container(
                          width: ThemeSelector.statics.defaultMediumGap,
                          height: ThemeSelector.statics.defaultMediumGap,
                          decoration: BoxDecoration(
                              color: ThemeSelector.colors.backgroundTant,
                              borderRadius: BorderRadius.circular(
                                  ThemeSelector.statics.defaultMediumGap)),
                          child: Center(
                            child: SvgPicture.asset(
                                'assets/images/offer_icon.svg'),
                          ),
                        ),
                        SizedBox(width: ThemeSelector.statics.defaultGap),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                              Text(
                                  DateFormat('d-M-yyyy | hh:mm')
                                      .format(notification.date),
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
