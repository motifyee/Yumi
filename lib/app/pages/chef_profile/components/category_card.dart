import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/domain/categories/entity/category.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: CommonDimens.defaultMicroGap,
        bottom: CommonDimens.defaultMicroGap,
        right: CommonDimens.defaultMicroGap,
      ),
      child: Container(
        padding: const EdgeInsets.all(CommonDimens.defaultMicroGap),
        decoration: BoxDecoration(
            color: CommonColors.background,
            borderRadius: BorderRadius.circular(CommonDimens.defaultGapExtreme),
            boxShadow: [
              BoxShadow(
                color: CommonColors.shadow,
                blurRadius: CommonDimens.defaultGap,
              )
            ]),
        child: Row(
          children: [
            Container(
              width: CommonDimens.defaultBlockGap,
              height: CommonDimens.defaultBlockGap,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(CommonDimens.defaultBlockGap)),
              child: Image.memory(
                Uri.parse(category.image ?? '').data?.contentAsBytes() ??
                    Uint8List(0),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/354.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: CommonDimens.defaultTitleGap,
              height: CommonDimens.defaultBlockGap,
              padding: const EdgeInsets.only(
                  top: CommonDimens.defaultMicroGap,
                  bottom: CommonDimens.defaultMicroGap,
                  left: CommonDimens.defaultMicroGap,
                  right: CommonDimens.defaultMicroGap),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    category.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: CommonFontSize.font_9,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
