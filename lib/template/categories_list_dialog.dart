import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';

class CategoriesListDialog extends StatelessWidget {
  const CategoriesListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(ResetCategoryEvent());
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width -
            ThemeSelector.statics.defaultBlockGap,
        padding: EdgeInsets.symmetric(
            vertical: ThemeSelector.statics.defaultBlockGap),
        decoration: BoxDecoration(
            color: ThemeSelector.colors.background,
            borderRadius: BorderRadius.circular(
                ThemeSelector.statics.defaultBorderRadiusMedium)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultBlockGap),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/categories_list.svg'),
                  Text(' '),
                  Text(
                    S.of(context).cuisines,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: ThemeSelector.fonts.font_16,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            BlocConsumer<CategoriesBloc, CategoriesState>(
              listener: (context, state) {},
              builder: (context, state) {
                return PaginationTemplate(
                  loadDate: () {
                    context
                        .read<CategoriesBloc>()
                        .add(GetCategoriesEvent(context: context));
                  },
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var category in state.categoriesModelList)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap),
                          child: Column(
                            children: [
                              Container(
                                width: ThemeSelector
                                    .statics.defaultGapExtraExtreme,
                                height: ThemeSelector.statics.defaultGapXXXL,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ThemeSelector.statics.defaultGap),
                                ),
                                child: category.image != null
                                    ? Image.memory(
                                        base64Decode(
                                          category.image ?? '',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      )
                                    : Image.asset(
                                        'assets/images/354'
                                        '.jpeg',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                              ),
                              SizedBox(
                                  height: ThemeSelector.statics.defaultGap),
                              Text(
                                category.name ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
