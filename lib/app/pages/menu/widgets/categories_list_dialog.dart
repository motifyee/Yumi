import 'dart:typed_data';

import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/widgets/meal_list.dart';

class CategoriesListDialog extends StatelessWidget {
  CategoriesListDialog({super.key, required this.menuTarget});

  OrderType menuTarget;

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesCubit>().reset();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - CommonDimens.defaultBlockGap,
        padding:
            const EdgeInsets.symmetric(vertical: CommonDimens.defaultBlockGap),
        decoration: BoxDecoration(
          color: CommonColors.background,
          borderRadius:
              BorderRadius.circular(CommonDimens.defaultBorderRadiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CommonDimens.defaultBlockGap,
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/categories_list.svg'),
                  const Text(' '),
                  Text(
                    S.of(context).cuisines,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: CommonFontSize.font_16,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: CommonDimens.defaultGap),
            BlocConsumer<CategoriesCubit, CategoriesState>(
              listener: (context, state) {},
              builder: (context, state) {
                return PaginationTemplate(
                  loadDate: () {
                    context.read<CategoriesCubit>().getAllCategories(
                          isPreOrder: menuTarget == OrderType.preOrder,
                        );
                    // .add(GetCategoriesEvent(
                    //     context: context,
                    //     isPreOrder: menuTarget == MenuTarget.preOrder));
                  },
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var category in state.categoriesPage.data)
                        GestureDetector(
                          onTap: () {
                            context.router.popForced();
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * .8,
                              ),
                              builder: (context) => MealListScreen(
                                menuTarget: menuTarget,
                                categoryId: category.id,
                              ),
                              backgroundColor: Colors.transparent,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultGap,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: CommonDimens.defaultGapExtraExtreme,
                                  height: CommonDimens.defaultGapXXXL,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      CommonDimens.defaultGap,
                                    ),
                                  ),
                                  child: Image.memory(
                                    Uri.parse(category.image ?? '')
                                            .data
                                            ?.contentAsBytes() ??
                                        Uint8List(0),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/354.jpeg',
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: CommonDimens.defaultGap),
                                Text(
                                  category.name ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (state.categoriesPage.isLoading)
                        const PacmanLoadingWidget(),
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
