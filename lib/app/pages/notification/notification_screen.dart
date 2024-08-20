import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:common_code/domain/notification/entity/notification.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, required this.isScreen});

  final bool isScreen;

  @override
  Widget build(BuildContext context) {
    context.read<NotificationCubit>().resetNotification();
    return Scaffold(
      appBar: isScreen
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              leading: TextButton(
                  onPressed: () {
                    G().router.pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: CommonColors.primary,
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
            padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultLineGap),
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
          const SizedBox(height: CommonDimens.defaultGap),
          const Expanded(
            child: _NotificationList(),
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
                  onTap: () {
                    showDialog(context: context, builder: (context) => _NotificationNote(notification: notification));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap, horizontal: CommonDimens.defaultTitleGap),
                    child: Row(
                      children: [
                        Container(
                          width: CommonDimens.defaultMediumGap,
                          height: CommonDimens.defaultMediumGap,
                          decoration: BoxDecoration(color: CommonColors.backgroundTant, borderRadius: BorderRadius.circular(CommonDimens.defaultMediumGap)),
                          child: Center(
                            child: SvgPicture.asset('assets/images/notifications/${notification.notificationType.name}.svg'),
                          ),
                        ),
                        const SizedBox(width: CommonDimens.defaultGap),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.description, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headlineMedium),
                              Text(DateFormat('d-M-yyyy | hh:mm').format(notification.createDate), style: Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (state.pagination.isLoading) const PacmanLoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}

class _NotificationNote extends StatelessWidget {
  const _NotificationNote({super.key, required this.notification});

  final NotificationS notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap, horizontal: CommonDimens.defaultTitleGap),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: CommonColors.background, borderRadius: BorderRadius.circular(CommonDimens.defaultGap)),
            padding: const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap, horizontal: CommonDimens.defaultTitleGap),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: CommonDimens.defaultMediumGap,
                  height: CommonDimens.defaultMediumGap,
                  decoration: BoxDecoration(color: CommonColors.backgroundTant, borderRadius: BorderRadius.circular(CommonDimens.defaultMediumGap)),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/notifications/${notification.notificationType.name}.svg',
                    ),
                  ),
                ),
                const SizedBox(width: CommonDimens.defaultGap),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.description, style: Theme.of(context).textTheme.headlineMedium),
                      Text(DateFormat('d-M-yyyy | hh:mm').format(notification.createDate), style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
