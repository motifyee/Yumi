import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/chef_profile/cubit/reviews/reviews_bloc.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/chef_profile/components/category_card.dart';
import 'package:yumi/app/pages/chef_profile/components/chef_bannar.dart';
import 'package:yumi/app/pages/chef_profile/components/chef_meal_card.dart';
import 'package:yumi/app/components/pagination_template.dart';
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
      create: (context) => CategoriesBloc(),
      child: Scaffold(
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
                    isShowFav: true,
                    isProfileClick: false,
                    isRequestStatus: true,
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
                                      ChefMealCard(
                                        meal: meal,
                                        chef: chef,
                                      )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      ThemeSelector.statics.defaultBlockGap),
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
                          child: Builder(builder: (context) {
                            return BlocConsumer<MealListBloc, MealListState>(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          for (var mealIndex = 0;
                                              mealIndex < state.meals.length;
                                              mealIndex += 2)
                                            ChefMealCard(
                                              meal: state.meals[mealIndex],
                                              chef: chef,
                                            )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          for (var mealIndex = 1;
                                              mealIndex < state.meals.length;
                                              mealIndex += 2)
                                            ChefMealCard(
                                              meal: state.meals[mealIndex],
                                              chef: chef,
                                            )
                                        ],
                                      ),
                                      if (state.pager.isLoading) Loading(),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
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
                                              menuTarget == MenuTarget.preOrder,
                                          chefId: chef.id,
                                        ),
                                      );
                                },
                                child: BlocConsumer<CategoriesBloc,
                                    CategoriesState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        for (var category
                                            in state.categoriesModelList)
                                          CategoriesCard(category: category),
                                        if (state.pager.isLoading)
                                          Loading(
                                              size: ThemeSelector
                                                  .statics.defaultBlockGap),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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
                                    return state.pager.isLoading
                                        ? Loading(
                                            size: ThemeSelector
                                                .statics.defaultBlockGap)
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
                                                    color: ThemeSelector
                                                        .colors.warning,
                                                    size: ThemeSelector
                                                        .fonts.font_12,
                                                  ),
                                                  Text(
                                                    '${chef.rate ?? '0'} ( ${state.pager.total < 1000 ? state.pager.total : (state.pager.total / 1000).toStringAsFixed(1)}${state.pager.total < 1000 ? '' : 'k'} Reviews )',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall
                                                        ?.copyWith(
                                                            fontSize:
                                                                ThemeSelector
                                                                    .fonts
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
                                        fontSize: ThemeSelector.fonts.font_12,
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
                                              itemSize:
                                                  ThemeSelector.fonts.font_24,
                                              ratingWidget: RatingWidget(
                                                empty: Icon(Icons.star_border,
                                                    color: ThemeSelector
                                                        .colors.warning),
                                                full: Icon(Icons.star,
                                                    color: ThemeSelector
                                                        .colors.warning),
                                                half: Icon(
                                                  Icons.star_half,
                                                  color: ThemeSelector
                                                      .colors.warning,
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
                        SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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
                                          padding: EdgeInsets.all(
                                              ThemeSelector.statics.defaultGap),
                                          child: ReviewCard(review: review),
                                        ),
                                      if (state.pager.isLoading) Loading(),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
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
      ),
    );
  }
}
