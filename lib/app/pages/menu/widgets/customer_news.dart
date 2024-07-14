import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/app/pages/menu/widgets/meal_list.dart';
import 'package:yumi/app/pages/menu/widgets/categories_list_dialog.dart';
import 'package:yumi/app/pages/menu/widgets/customer_chef_list.dart';
import 'package:yumi/app/pages/menu/widgets/offer_carousel.dart';

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
                      padding: const EdgeInsets.symmetric(
                          horizontal: CommonDimens.defaultBlockGap),
                      child: Row(
                        children: [
                          SizedBox(
                              height: CommonDimens.defaultLineGap,
                              width: CommonDimens.defaultLineGap,
                              child: SvgPicture.asset(
                                'assets/images/location.svg',
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(width: CommonDimens.defaultGap),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultInputGap),
                    child: TextFormFieldTemplate(
                      borderStyle: TextFormFieldBorderStyle.borderedRound,
                      hintText: S.of(context).searchForFood,
                      prefixIcon: Padding(
                        padding:
                            const EdgeInsets.all(CommonDimens.defaultInputGap),
                        child: SvgPicture.asset('assets/images/search.svg'),
                      ),
                      suffixIcon: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(
                              CommonDimens.defaultInputGap),
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
                        height: CommonDimens.defaultTitleGap,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        left: -CommonDimens.defaultLineGap,
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<MealCubit>()
                                .reset(menuTarget: menuTarget);
                            context.read<CategoriesCubit>().reset();
                            // .add(ResetCategoryEvent());
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
                            height: CommonDimens.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (CommonDimens.defaultLineGap * 1.5),
                            decoration: BoxDecoration(
                                color: CommonColors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    CommonDimens.defaultBorderRadiusMedium),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          CommonColors.shadow.withOpacity(.1),
                                      blurRadius: 4)
                                ]),
                            child: Center(
                                child: Text(
                              S.of(context).dishName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: CommonFontSize.font_9),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        left: (MediaQuery.of(context).size.width / 4) -
                            CommonDimens.defaultLineGap,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CategoriesListDialog(
                                    menuTarget: menuTarget));
                          },
                          child: Container(
                            height: CommonDimens.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (CommonDimens.defaultLineGap),
                            decoration: BoxDecoration(
                              color: CommonColors.backgroundTant,
                              borderRadius: BorderRadius.circular(
                                  CommonDimens.defaultBorderRadius),
                              boxShadow: [
                                BoxShadow(
                                    color: CommonColors.shadow.withOpacity(.1),
                                    blurRadius: 4)
                              ],
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).cuisines,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontSize: CommonFontSize.font_9),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ((MediaQuery.of(context).size.width / 4) * 2) -
                            CommonDimens.defaultLineGap,
                        child: GestureDetector(
                          child: Container(
                            height: CommonDimens.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (CommonDimens.defaultLineGap),
                            decoration: BoxDecoration(
                                color: CommonColors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    CommonDimens.defaultBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          CommonColors.shadow.withOpacity(.1),
                                      blurRadius: 4)
                                ]),
                            child: Center(
                                child: Text(
                              S.of(context).recentSearch,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: CommonFontSize.font_9),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ((MediaQuery.of(context).size.width / 4) * 3) -
                            CommonDimens.defaultLineGap,
                        child: GestureDetector(
                          child: Container(
                            height: CommonDimens.defaultTitleGap,
                            width: (MediaQuery.of(context).size.width / 4) +
                                (CommonDimens.defaultLineGap),
                            decoration: BoxDecoration(
                                color: CommonColors.backgroundTant,
                                borderRadius: BorderRadius.circular(
                                    CommonDimens.defaultBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          CommonColors.shadow.withOpacity(.1),
                                      blurRadius: 4)
                                ]),
                            child: Center(
                                child: Text(
                              S.of(context).suggestions,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: CommonFontSize.font_9),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: CommonDimens.defaultBlockGap,
                          vertical: CommonDimens.defaultMicroGap,
                        ),
                        decoration: BoxDecoration(
                            color: CommonColors.backgroundTant,
                            borderRadius: BorderRadius.circular(
                                CommonDimens.defaultBorderRadiusExtraLarge)),
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
