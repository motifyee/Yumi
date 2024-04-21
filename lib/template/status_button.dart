import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/user/user_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class StatusButton extends StatelessWidget {
  StatusButton({super.key, this.forGuide});

  StatusEnum? forGuide;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        StatusEnum status =
            state.user.status == 1 ? StatusEnum.ready : StatusEnum.busy;
        if (forGuide != null) status = forGuide!;
        return TextButton(
          onPressed: forGuide != null
              ? null
              : () {
                  print('asdas das das d asd ........................');
                  print(state.loading);
                  if (state.loading) return;
                  context.read<UserBloc>().add(UserStatusUpdateEvent());
                },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => status == StatusEnum.ready
                  ? ThemeSelector.colors.success
                  : ThemeSelector.colors.primaryDisabled,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              status == StatusEnum.ready
                  ? SvgPicture.asset('assets/images/opened.svg')
                  : SvgPicture.asset('assets/images/busy.svg'),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                status == StatusEnum.ready
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
