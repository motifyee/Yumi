import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/chef_profile/cubit/reviews/reviews_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/chef_profile/components/category_card.dart';
import 'package:yumi/app/pages/chef_profile/components/chef_bannar.dart';
import 'package:yumi/app/pages/chef_profile/components/chef_meal_card.dart';
import 'package:yumi/app/pages/chef_profile/components/review_card.dart';

@RoutePage()
class ChefProfileScreen extends StatelessWidget {
  ChefProfileScreen({super.key, required this.chef, required this.menuTarget});

  final Chef chef;
  MenuTarget menuTarget;

  List<String> eventPhotos = [];

  @override
  Widget build(BuildContext context) {
    eventPhotos = [
      chef.imageProfile1 ?? '',
      chef.imageProfile2 ?? '',
      chef.imageProfile3 ?? '',
      chef.imageProfile4 ?? '',
      chef.imageProfile5 ?? '',
    ]..removeWhere((e) => e.isEmpty);

    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: Scaffold(
        body: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 1,
          minChildSize: .8,
          snap: true,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: Container(
              decoration: BoxDecoration(color: CommonColors.background),
              child: Column(
                children: [
                  ChefBanner(
                    menuTarget: menuTarget,
                    chef: chef,
                    width: MediaQuery.of(context).size.width,
                    isShowFav: true,
                    isProfileClick: false,
                    isRequestStatus: true,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(
                          CommonDimens.defaultBorderRadiusLarge),
                    ),
                  ),
                  const SizedBox(height: CommonDimens.defaultBlockGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultGap),
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
                                    for (var meal in [const Meal()])
                                      ChefMealCard(
                                        meal: meal,
                                        chef: chef,
                                      )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: CommonDimens.defaultBlockGap),
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
                          height: CommonDimens.defaultImageHeight,
                          child: eventPhotos.isEmpty
                              ? Center(
                                  child: Text(
                                    S.of(context).empty,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: CommonColors.secondaryFaint),
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
                                            CommonDimens
                                                .defaultBorderRadiusExtraLarge)),
                                    child: Image.memory(
                                      Uri.parse(eventPhotos[index] ?? '')
                                              .data
                                              ?.contentAsBytes() ??
                                          Uint8List(0),
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
                        const SizedBox(height: CommonDimens.defaultBlockGap),
                        Row(
                          children: [
                            Text(
                              S.of(context).meals,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        BlocProvider(
                          create: (context) => MealCubit(),
                          child: Builder(builder: (context) {
                            return BlocConsumer<MealCubit, MealState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return PaginationTemplate(
                                  loadDate: () {
                                    context.read<MealCubit>().updateMeals(
                                        chefId: chef.id,
                                        menuTarget: menuTarget);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          for (var mealIndex = 0;
                                              mealIndex <
                                                  state.pagination.data.length;
                                              mealIndex += 2)
                                            ChefMealCard(
                                              meal: state
                                                  .pagination.data[mealIndex],
                                              chef: chef,
                                            )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          for (var mealIndex = 1;
                                              mealIndex <
                                                  state.pagination.data.length;
                                              mealIndex += 2)
                                            ChefMealCard(
                                              meal: state
                                                  .pagination.data[mealIndex],
                                              chef: chef,
                                            )
                                        ],
                                      ),
                                      if (state.pagination.isLoading)
                                        const PacmanLoadingWidget(),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        const SizedBox(height: CommonDimens.defaultBlockGap),
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
                                  context
                                      .read<CategoriesCubit>()
                                      .getChefCategories(
                                        isPreOrder:
                                            menuTarget == MenuTarget.preOrder,
                                        chefId: chef.id,
                                      );
                                  //       .add(
                                  //         GetCategoriesEvent(
                                  //           context: context,
                                  //           isPreOrder:
                                  //               menuTarget == MenuTarget.preOrder,
                                  //           chefId: chef.id,
                                  //         ),
                                  //       );
                                },
                                child: BlocConsumer<CategoriesCubit,
                                    CategoriesState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        for (var category
                                            in state.categoriesPage.data)
                                          CategoriesCard(category: category),
                                        if (state.categoriesPage.isLoading)
                                          const PacmanLoadingWidget(
                                            size: CommonDimens.defaultBlockGap,
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: CommonDimens.defaultBlockGap),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocProvider(
                              create: (context) => ReviewsCubit(),
                              child: Builder(builder: (context) {
                                context
                                    .read<ReviewsCubit>()
                                    .getReviews(chefID: chef.id!);
                                return BlocBuilder<ReviewsCubit, ReviewsState>(
                                  builder: (context, state) {
                                    return state.pagination.isLoading
                                        ? const PacmanLoadingWidget(
                                            size: CommonDimens.defaultBlockGap)
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                S.of(context).happyCustomer,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: CommonColors.warning,
                                                    size:
                                                        CommonFontSize.font_12,
                                                  ),
                                                  Text(
                                                    '${chef.rate ?? '0'} ( ${state.pagination.total < 1000 ? state.pagination.total : (state.pagination.total / 1000).toStringAsFixed(1)}${state.pagination.total < 1000 ? '' : 'k'} Reviews )',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall
                                                        ?.copyWith(
                                                            fontSize:
                                                                CommonFontSize
                                                                    .font_10),
                                                  )
                                                ],
                                              )
                                            ],
                                          );
                                  },
                                );
                              }),
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
                                        fontSize: CommonFontSize.font_12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                BlocProvider(
                                  create: (context) => ReviewsCubit(),
                                  child: Builder(
                                    builder: (context) {
                                      context.read<ReviewsCubit>().getReviews(
                                            chefID: chef.id!,
                                            isMyReviews: true,
                                          );

                                      return BlocConsumer<ReviewsCubit,
                                          ReviewsState>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          return GestureDetector(
                                            onTap: () {},
                                            child: RatingBar(
                                              initialRating: state.reviews
                                                      .firstOrNull?.rate ??
                                                  0,
                                              allowHalfRating: true,
                                              ignoreGestures: true,
                                              itemSize: CommonFontSize.font_24,
                                              ratingWidget: RatingWidget(
                                                empty: Icon(Icons.star_border,
                                                    color:
                                                        CommonColors.warning),
                                                full: Icon(Icons.star,
                                                    color:
                                                        CommonColors.warning),
                                                half: Icon(
                                                  Icons.star_half,
                                                  color: CommonColors.warning,
                                                ),
                                              ),
                                              onRatingUpdate: (value) {},
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: CommonDimens.defaultBlockGap),
                        BlocProvider(
                          create: (context) => ReviewsCubit(),
                          child: Builder(builder: (context) {
                            return BlocConsumer<ReviewsCubit, ReviewsState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return PaginationTemplate(
                                  loadDate: () {
                                    context
                                        .read<ReviewsCubit>()
                                        .getReviews(chefID: chef.id!);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (var review in state.reviews)
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              CommonDimens.defaultGap),
                                          child: ReviewCard(review: review),
                                        ),
                                      if (state.pagination.isLoading)
                                        const PacmanLoadingWidget(),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        const SizedBox(height: CommonDimens.defaultBlockGap),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
