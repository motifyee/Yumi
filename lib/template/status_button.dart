import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/user/user_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class StatusButton extends StatefulWidget {
  StatusButton({super.key, this.forGuide});

  StatusEnum? forGuide;

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  @override
  void initState() {
    if (G.isChefApp) {
      context.read<UserBloc>().add(ChefStatusCheckEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        StatusEnum status =
            state.user.status == 1 ? StatusEnum.ready : StatusEnum.busy;
        if (widget.forGuide != null) status = widget.forGuide!;
        return TextButton(
          onPressed:
              widget.forGuide != null || state.isStatusLocked || state.loading
                  ? null
                  : () {
                      if (state.loading) return;
                      context.read<UserBloc>().add(UserStatusUpdateEvent());
                    },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => state.loading
                  ? ThemeSelector.colors.secondaryFaint
                  : status == StatusEnum.ready
                      ? ThemeSelector.colors.success
                      : ThemeSelector.colors.primaryDisabled,
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
                  : status == StatusEnum.ready
                      ? SvgPicture.asset('assets/images/opened.svg')
                      : SvgPicture.asset('assets/images/busy.svg'),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                state.loading
                    ? '...'
                    : status == StatusEnum.ready
                        ? S.of(context).opened
                        : S.of(context).busy,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: status == StatusEnum.ready
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
