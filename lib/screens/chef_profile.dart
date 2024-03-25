import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/forms/customer_pre_order_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/chef_model.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/category_card.dart';
import 'package:yumi/template/chef_bannar.dart';
import 'package:yumi/template/chef_meal_card.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/review_card.dart';

@RoutePage()
class ChefProfileScreen extends StatelessWidget {
  ChefProfileScreen({super.key, required this.chef, required this.menuTarget});

  final ChefModel chef;
  MenuTarget menuTarget;

  late List<String> eventPhotos;

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(ResetCategoryEvent());

    eventPhotos = [
      chef.imageProfile1 ?? '',
      chef.imageProfile2 ?? '',
      chef.imageProfile3 ?? '',
      chef.imageProfile4 ?? '',
      chef.imageProfile5 ?? '',
    ]..removeWhere((e) => e.isEmpty);

    return Scaffold(
      body: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 1,
        minChildSize: .8,
        snap: true,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration: BoxDecoration(color: ThemeSelector.colors.background),
            child: Column(
              children: [
                ChefBanner(
                  menuTarget: menuTarget,
                  chef: chef,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadiusLarge),
                  ),
                ),
                SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultGap),
                  child: Column(
                    children: [
                      if (false)
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  S.of(context).orderAgain,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                            PaginationTemplate(
                              loadDate: () {},
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var meal in [MealModel()])
                                    ChefMealCard(meal: meal)
                                ],
                              ),
                            ),
                            SizedBox(
                                height: ThemeSelector.statics.defaultBlockGap),
                          ],
                        ),
                      Row(
                        children: [
                          Text(
                            S.of(context).chefEvents,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ThemeSelector.statics.defaultImageHeight,
                        child: eventPhotos.isEmpty
                            ? Center(
                                child: Text(
                                  S.of(context).empty,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: ThemeSelector
                                              .colors.secondaryFaint),
                                ),
                              )
                            : Swiper(
                                itemCount: eventPhotos.length,
                                autoplay: true,
                                viewportFraction: 0.8,
                                layout: SwiperLayout.STACK,
                                itemWidth:
                                    MediaQuery.of(context).size.width * .8,
                                itemBuilder: (context, index) => Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ThemeSelector.statics
                                              .defaultBorderRadiusExtraLarge)),
                                  child: Image.memory(
                                    base64Decode(eventPhotos[index]),
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/354.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                      Row(
                        children: [
                          Text(
                            S.of(context).meals,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      BlocProvider(
                        create: (context) => MealListBloc(),
                        child: BlocConsumer<MealListBloc, MealListState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return PaginationTemplate(
                              loadDate: () {
                                context.read<MealListBloc>().add(
                                    MealListUpdateEvent(
                                        context: context,
                                        chefId: chef.id,
                                        menuTarget: menuTarget));
                              },
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      for (var mealIndex = 0;
                                          mealIndex < state.meals.length;
                                          mealIndex += 2)
                                        ChefMealCard(
                                            meal: state.meals[mealIndex])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      for (var mealIndex = 1;
                                          mealIndex < state.meals.length;
                                          mealIndex += 2)
                                        ChefMealCard(
                                            meal: state.meals[mealIndex])
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                      Row(
                        children: [
                          Text(
                            S.of(context).cuisine,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PaginationTemplate(
                              scrollDirection: Axis.horizontal,
                              loadDate: () {
                                context.read<CategoriesBloc>().add(
                                    GetCategoriesEvent(
                                        context: context,
                                        isPreOrder:
                                            menuTarget == MenuTarget.preOrder));
                              },
                              child:
                                  BlocConsumer<CategoriesBloc, CategoriesState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      for (var category
                                          in state.categoriesModelList)
                                        CategoriesCard(category: category),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          if (menuTarget == MenuTarget.preOrder)
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => CustomerPreOrderForm(
                                    chefId: chef.id ?? '',
                                    isPickUpOnly: chef.pickupOnly ?? false,
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    S.of(context).addPreOrder,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            fontSize:
                                                ThemeSelector.fonts.font_10),
                                  ),
                                  const Text(' '),
                                  Container(
                                    width: ThemeSelector.statics.defaultLineGap,
                                    height:
                                        ThemeSelector.statics.defaultLineGap,
                                    decoration: BoxDecoration(
                                      color: ThemeSelector.colors.primary,
                                      borderRadius: BorderRadius.circular(
                                          ThemeSelector.statics.defaultLineGap),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: ThemeSelector.colors.onPrimary,
                                        size: ThemeSelector.fonts.font_12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).happyCustomer,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ThemeSelector.colors.warning,
                                    size: ThemeSelector.fonts.font_12,
                                  ),
                                  Text(
                                    '4.8(1.3k Reviews)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            fontSize:
                                                ThemeSelector.fonts.font_10),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).createYourReviewNow,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      fontSize: ThemeSelector.fonts.font_12,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              RatingBar(
                                  initialRating: 0,
                                  allowHalfRating: true,
                                  itemSize: ThemeSelector.fonts.font_24,
                                  ratingWidget: RatingWidget(
                                    empty: Icon(Icons.star_border,
                                        color: ThemeSelector.colors.warning),
                                    full: Icon(Icons.star,
                                        color: ThemeSelector.colors.warning),
                                    half: Icon(
                                      Icons.star_half,
                                      color: ThemeSelector.colors.warning,
                                    ),
                                  ),
                                  onRatingUpdate: (value) {})
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                      PaginationTemplate(
                        loadDate: () {},
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var review in [0, 1, 2, 3, 4])
                              Padding(
                                padding: EdgeInsets.all(
                                    ThemeSelector.statics.defaultGap),
                                child: const ReviewCard(),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
