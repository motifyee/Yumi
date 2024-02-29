import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class DeleteDialogTemplate extends StatelessWidget {
  DeleteDialogTemplate(
      {super.key,
      required this.actions,
      required this.title,
      required this.content});

  Function() actions;
  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeSelector.colors.background,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: ThemeSelector.colors.primary,
        fontSize: ThemeSelector.fonts.font_12,
        fontWeight: FontWeight.w700,
      ),
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/images/trash.svg',
            height: ThemeSelector.fonts.font_12,
          ),
          const Text(' '),
          Text(title),
        ],
      ),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: Text(S.of(context).cancel)),
        TextButton(onPressed: actions, child: Text(S.of(context).delete)),
      ],
    );
  }
}
