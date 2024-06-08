import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class DeleteDialogTemplate extends StatefulWidget {
  DeleteDialogTemplate({
    super.key,
    required this.actions,
    required this.title,
    required this.content,
  });

  Future<bool> Function() actions;
  String title;
  String content;

  @override
  State<DeleteDialogTemplate> createState() => _DeleteDialogTemplateState();
}

class _DeleteDialogTemplateState extends State<DeleteDialogTemplate> {
  bool isDeletingLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeSelector.colors.background,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/images/trash.svg',
            height: ThemeSelector.fonts.font_12,
          ),
          const Text(' '),
          Text(widget.title),
        ],
      ),
      content: Text(widget.content),
      actions: [
        TextButton(
            onPressed: () {
              context.router.maybePop();
            },
            child: Text(S.of(context).cancel)),
        TextButton(
            onPressed: () async {
              if (isDeletingLoading) return;
              setState(() {
                isDeletingLoading = true;
              });
              await widget
                  .actions()
                  .then((v) => setState(() {
                        isDeletingLoading = false;
                      }))
                  .catchError((e) => setState(() {
                        isDeletingLoading = false;
                      }));
            },
            child: isDeletingLoading
                ? SizedBox(
                    width: ThemeSelector.statics.defaultTitleGapLarge,
                    child: Loading(
                      size: ThemeSelector.statics.defaultBlockGap,
                    ),
                  )
                : Text(S.of(context).delete)),
      ],
    );
  }
}
