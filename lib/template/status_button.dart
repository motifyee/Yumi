import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/user/user_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class StatusButton extends StatelessWidget {
  StatusButton({super.key, this.forGuide});
  StatusEnum? forGuide;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        StatusEnum status = StatusEnum.online;
        switch (state.user.status) {
          case 0:
            status = StatusEnum.offline;
            break;
          case 1:
            status = StatusEnum.online;
            break;
          case 2:
            status = StatusEnum.busy;
            break;
        }
        if (forGuide != null) status = forGuide!;
        return TextButton(
          onPressed: forGuide != null || state.loading || state.user.status == 2
              ? null
              : () {
                  if (state.loading) return;
                  context.read<UserCubit>().updateStatus();
                  // context.read<xUserBloc>().add(UserStatusUpdateEvent());
                },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) => state.loading
                  ? ThemeSelector.colors.secondaryFaint
                  : status == StatusEnum.online
                      ? ThemeSelector.colors.success
                      : status == StatusEnum.busy
                          ? ThemeSelector.colors.primaryDisabled
                          : ThemeSelector.colors.secondaryTant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.loading
                  ? SvgPicture.asset(
                      'assets/images/busy.svg',
                      colorFilter: ColorFilter.mode(
                          ThemeSelector.colors.secondaryFaint, BlendMode.srcIn),
                    )
                  : status == StatusEnum.online
                      ? SvgPicture.asset('assets/images/opened.svg')
                      : SvgPicture.asset(
                          'assets/images/busy.svg',
                          colorFilter: ColorFilter.mode(
                              status == StatusEnum.busy
                                  ? ThemeSelector.colors.primaryDisabled
                                  : ThemeSelector.colors.secondaryTant,
                              BlendMode.srcIn),
                        ),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                state.loading
                    ? '...'
                    : status == StatusEnum.online
                        ? S.of(context).opened
                        : status == StatusEnum.busy
                            ? S.of(context).busy
                            : S.of(context).offline,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: status == StatusEnum.online
                          ? ThemeSelector.colors.onSuccess
                          : ThemeSelector.colors.onPrimary,
                    ),
              )
            ],
          ),
        );
      },
    );
  }
}
