import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class StatusButton extends StatelessWidget {
  StatusButton({super.key, required this.status, this.onPressed});

  final StatusEnum status;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: status == StatusEnum.busy ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => status == StatusEnum.opened
              ? ThemeSelector.colors.success
              : status == StatusEnum.closed
                  ? ThemeSelector.colors.primary
                  : ThemeSelector.colors.primaryDisabled,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          status == StatusEnum.opened
              ? SvgPicture.asset('assets/images/opened.svg')
              : status == StatusEnum.closed
                  ? SvgPicture.asset('assets/images/closed'
                      '.svg')
                  : SvgPicture.asset('assets/images/busy.svg'),
          SizedBox(width: ThemeSelector.statics.defaultGap),
          Text(
            status == StatusEnum.opened
                ? S.of(context).opened
                : status == StatusEnum.closed
                    ? S.of(context).closed
                    : S.of(context).busy,
            style: TextStyle(
              color: status == StatusEnum.opened
                  ? ThemeSelector.colors.onSuccess
                  : ThemeSelector.colors.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}

enum StatusEnum { opened, closed, busy }
