import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/generated/l10n.dart';

class DeleteDialogTemplate extends StatefulWidget {
  const DeleteDialogTemplate({
    super.key,
    required this.actions,
    required this.title,
    required this.content,
  });

  final Future<bool> Function() actions;
  final String title;
  final String content;

  @override
  State<DeleteDialogTemplate> createState() => _DeleteDialogTemplateState();
}

class _DeleteDialogTemplateState extends State<DeleteDialogTemplate> {
  bool isDeletingLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CommonColors.background,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/images/trash.svg',
            height: CommonFontSize.font_12,
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
                ? const SizedBox(
                    width: CommonDimens.defaultTitleGapLarge,
                    child: PacmanLoadingWidget(
                      size: CommonDimens.defaultBlockGap,
                    ),
                  )
                : Text(S.of(context).delete)),
      ],
    );
  }
}
