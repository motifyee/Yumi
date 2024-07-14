import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:common_code/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
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
            padding: const EdgeInsets.symmetric(
                horizontal: CommonDimens.defaultLineGap),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CommonDimens.defaultGap,
                        horizontal: CommonDimens.defaultTitleGap),
                    child: Row(
                      children: [
                        Container(
                          width: CommonDimens.defaultMediumGap,
                          height: CommonDimens.defaultMediumGap,
                          decoration: BoxDecoration(
                              color: CommonColors.backgroundTant,
                              borderRadius: BorderRadius.circular(
                                  CommonDimens.defaultMediumGap)),
                          child: Center(
                            child: SvgPicture.asset(
                                'assets/images/offer_icon.svg'),
                          ),
                        ),
                        const SizedBox(width: CommonDimens.defaultGap),
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
                                      .format(notification.createDate),
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (state.pagination.isLoading) const Loading(),
            ],
          );
        },
      ),
    );
  }
}
