import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/screens/meal_list.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/categories_list_dialog.dart';
import 'package:yumi/template/customer_chef_list.dart';
import 'package:yumi/template/offer_carousel.dart';
import 'package:yumi/template/text_form_field.dart';

class CustomerNews extends StatelessWidget {
  CustomerNews({super.key, required this.menuTarget});

  MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router
                          .replaceAll([const CustomerLocationRoute()]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ThemeSelector.statics.defaultBlockGap),
                      child: Row(
                        children: [
                          SizedBox(
                              height: ThemeSelector.statics.defaultLineGap,
                              width: ThemeSelector.statics.defaultLineGap,
                              child: SvgPicture.asset(
                                'assets/images/location.svg',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(width: ThemeSelector.statics.defaultGap),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocConsumer<UserCubit, UserState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return RichText(
                                      text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    children: [
                                      TextSpan(
                                        text: S.of(context).hi,
                                      ),
                                      const TextSpan(
                                        text: ' ',
                                      ),
                                      TextSpan(
                                        text: state.user.userName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ));
                                },
                              ),
                              Text(
                                S.of(context).whatYouWishToEatToday,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultInputGap),
                    child: TextFormFieldTemplate(
                      borderStyle: TextFormFieldBorderStyle.borderedRound,
                      hintText: S.of(context).searchForFood,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(
                            ThemeSelector.statics.defaultInputGap),
                        child: SvgPicture.asset('assets/images/search.svg'),
                      ),
                      suffixIcon: GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.all(
                              ThemeSelector.statics.defaultInputGap),
                          child: SvgPicture.asset('assets/images/config.svg'),
                        ),
                      ),
                    ),
                  ),
                  OfferCarousel(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: ThemeSelector.statics.defaultTitleGap,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        left: -ThemeSelector.statics.defaultLineGap,
                        child: GestureDetector(
                          onTap: () {
                            context.read<MealListBloc>().add(
                                MealListResetEvent(menuTarget: menuTarget));
                            context
                                .read<CategoriesBloc>()
                                .add(ResetCategoryEvent());
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * .8,
                                minHeight:
                                    MediaQuery.of(context).size.height * .7,
                              ),
                              builder: (context) => MealListScreen(
                                menuTarget: menuTarget,
                                isResetOnInit: false,
                              ),
                              backgroundColor: Colors.transparent,
                            );
                          },
                          child: Container(
                            height: ThemeSelector.statics.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (ThemeSelector.statics.defaultLineGap * 1.5),
                            decoration: BoxDecoration(
                                color: ThemeSelector.colors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    ThemeSelector
                                        .statics.defaultBorderRadiusMedium),
                                boxShadow: [
                                  BoxShadow(
                                      color: ThemeSelector.colors.shadow
                                          .withOpacity(.1),
                                      blurRadius: 4)
                                ]),
                            child: Center(
                                child: Text(
                              S.of(context).dishName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: ThemeSelector.fonts.font_9),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        left: (MediaQuery.of(context).size.width / 4) -
                            ThemeSelector.statics.defaultLineGap,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CategoriesListDialog(
                                    menuTarget: menuTarget));
                          },
                          child: Container(
                            height: ThemeSelector.statics.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (ThemeSelector.statics.defaultLineGap),
                            decoration: BoxDecoration(
                              color: ThemeSelector.colors.backgroundTant,
                              borderRadius: BorderRadius.circular(
                                  ThemeSelector.statics.defaultBorderRadius),
                              boxShadow: [
                                BoxShadow(
                                    color: ThemeSelector.colors.shadow
                                        .withOpacity(.1),
                                    blurRadius: 4)
                              ],
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).cuisines,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontSize: ThemeSelector.fonts.font_9),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ((MediaQuery.of(context).size.width / 4) * 2) -
                            ThemeSelector.statics.defaultLineGap,
                        child: GestureDetector(
                          child: Container(
                            height: ThemeSelector.statics.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (ThemeSelector.statics.defaultLineGap),
                            decoration: BoxDecoration(
                                color: ThemeSelector.colors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    ThemeSelector.statics.defaultBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                      color: ThemeSelector.colors.shadow
                                          .withOpacity(.1),
                                      blurRadius: 4)
                                ]),
                            child: Center(
                                child: Text(
                              S.of(context).recentSearch,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: ThemeSelector.fonts.font_9),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ((MediaQuery.of(context).size.width / 4) * 3) -
                            ThemeSelector.statics.defaultLineGap,
                        child: GestureDetector(
                          child: Container(
                            height: ThemeSelector.statics.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (ThemeSelector.statics.defaultLineGap),
                            decoration: BoxDecoration(
                                color: ThemeSelector.colors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    ThemeSelector.statics.defaultBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                      color: ThemeSelector.colors.shadow
                                          .withOpacity(.1),
                                      blurRadius: 4)
                                ]),
                            child: Center(
                                child: Text(
                              S.of(context).suggestions,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: ThemeSelector.fonts.font_9),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomerChefList(menuTarget: menuTarget),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: SvgPicture.asset('assets/images/surprise.svg'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ThemeSelector.statics.defaultBlockGap,
                          vertical: ThemeSelector.statics.defaultMicroGap,
                        ),
                        decoration: BoxDecoration(
                            color: ThemeSelector.colors.backgroundTant,
                            borderRadius: BorderRadius.circular(ThemeSelector
                                .statics.defaultBorderRadiusExtraLarge)),
                        child: Column(
                          children: [
                            Text(
                              '150',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              S.of(context).points,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
