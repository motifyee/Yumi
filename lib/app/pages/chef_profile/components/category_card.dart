import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/categories_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.category});

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ThemeSelector.statics.defaultMicroGap,
        bottom: ThemeSelector.statics.defaultMicroGap,
        right: ThemeSelector.statics.defaultMicroGap,
      ),
      child: Container(
        padding: EdgeInsets.all(ThemeSelector.statics.defaultMicroGap),
        decoration: BoxDecoration(
            color: ThemeSelector.colors.background,
            borderRadius:
                BorderRadius.circular(ThemeSelector.statics.defaultGapExtreme),
            boxShadow: [
              BoxShadow(
                color: ThemeSelector.colors.shadow,
                blurRadius: ThemeSelector.statics.defaultGap,
              )
            ]),
        child: Row(
          children: [
            Container(
              width: ThemeSelector.statics.defaultBlockGap,
              height: ThemeSelector.statics.defaultBlockGap,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      ThemeSelector.statics.defaultBlockGap)),
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
              width: ThemeSelector.statics.defaultTitleGap,
              height: ThemeSelector.statics.defaultBlockGap,
              padding: EdgeInsets.only(
                  top: ThemeSelector.statics.defaultMicroGap,
                  bottom: ThemeSelector.statics.defaultMicroGap,
                  left: ThemeSelector.statics.defaultMicroGap,
                  right: ThemeSelector.statics.defaultMicroGap),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    category.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: ThemeSelector.fonts.font_9,
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
