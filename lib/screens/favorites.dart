import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/chefs/chefs_list_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/chef_bannar.dart';
import 'package:yumi/template/pagination_template.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final PageController favPageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultBlockGap),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/heart.svg',
                height: ThemeSelector.statics.defaultInputGap,
                colorFilter: ColorFilter.mode(
                    ThemeSelector.colors.secondary, BlendMode.srcIn),
              ),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                S.of(context).favorites,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  favPageController.jumpToPage(0);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/users.svg',
                    colorFilter: ColorFilter.mode(
                        ThemeSelector.colors.primary, BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  favPageController.jumpToPage(1);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/meals.svg',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Expanded(
            child: PageView(
              controller: favPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                PaginationTemplate(
                  scrollDirection: Axis.vertical,
                  loadDate: () {
                    context
                        .read<ChefsListBloc>()
                        .add(GetChefsListEvent(context: context));
                  },
                  child: BlocConsumer<ChefsListBloc, ChefsListState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: Column(
                          children: [
                            for (var chef in state.chefs)
                              GestureDetector(
                                onTap: () {
                                  context.router
                                      .push(ChefProfileRoute(chef: chef));
                                },
                                child: ChefBanner(
                                  chef: chef,
                                  width: MediaQuery.of(context).size.width -
                                      (ThemeSelector.statics.defaultGap * 10),
                                  height: ThemeSelector
                                      .statics.defaultImageHeightSmall,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(ThemeSelector
                                        .statics.defaultBorderRadius),
                                    topRight: Radius.circular(ThemeSelector
                                        .statics.defaultBorderRadius),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                PaginationTemplate(
                  loadDate: () {
                    context
                        .read<CategoriesBloc>()
                        .add(GetCategoriesEvent(context: context));
                  },
                  scrollDirection: Axis.vertical,
                  child: BlocConsumer<CategoriesBloc, CategoriesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Column(
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
                                    height:
                                        ThemeSelector.statics.defaultGapXXXL,
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
