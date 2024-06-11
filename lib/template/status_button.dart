import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/domain/user/entity/user.dart';
import 'package:yumi/statics/theme_statics.dart';

class StatusButton extends StatelessWidget {
  StatusButton({super.key, this.forGuide});
  UserStatus? forGuide;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        UserStatus status = UserStatus.online;
        switch (state.user.status) {
          case 0:
            status = UserStatus.offline;
            break;
          case 1:
            status = UserStatus.online;
            break;
          case 2:
            status = UserStatus.busy;
            break;
        }
        if (forGuide != null) status = forGuide!;
        return TextButton(
          onPressed: forGuide != null || state.loading || state.user.status == 2
              ? null
              : () {
                  if (state.loading) return;
                  context.read<UserCubit>().updateStatus();
                },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) => state.loading
                  ? ThemeSelector.colors.secondaryFaint
                  : status == UserStatus.online
                      ? ThemeSelector.colors.success
                      : status == UserStatus.busy
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
                  : status == UserStatus.online
                      ? SvgPicture.asset('assets/images/opened.svg')
                      : SvgPicture.asset(
                          'assets/images/busy.svg',
                          colorFilter: ColorFilter.mode(
                              status == UserStatus.busy
                                  ? ThemeSelector.colors.primaryDisabled
                                  : ThemeSelector.colors.secondaryTant,
                              BlendMode.srcIn),
                        ),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                state.loading
                    ? '...'
                    : status == UserStatus.online
                        ? S.of(context).opened
                        : status == UserStatus.busy
                            ? S.of(context).busy
                            : S.of(context).offline,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: status == UserStatus.online
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
