import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/bloc/chefs/chefs_list_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';
import 'package:yumi/template/chef_bannar.dart';
import 'package:yumi/template/pagination_template.dart';

class CustomerChefList extends StatelessWidget {
  const CustomerChefList({super.key, required this.menuTarget});

  static PageController controller = PageController();
  final MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Builder(
        builder: (context) => Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultGap * 2,
                  vertical: ThemeSelector.statics.defaultGap),
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Container(
                        width: ThemeSelector.statics.defaultLineGap,
                        height: ThemeSelector.statics.defaultLineGap,
                        padding: EdgeInsets.all(
                            ThemeSelector.statics.defaultMicroGap),
                        decoration: BoxDecoration(
                            color: ThemeSelector.colors.secondary,
                            borderRadius: BorderRadius.circular(ThemeSelector
                                .statics.defaultBorderRadiusSmall)),
                        child: Center(
                          child: SvgPicture.asset('assets/images/profile1.svg'),
                        ),
                      ),
                      const Text(' '),
                      Text(
                        S.of(context).chefs,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: ThemeSelector.fonts.font_16,
                            ),
                      ),
                      if (menuTarget == MenuTarget.order)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ActionButton(
                                label: S.of(context).online,
                                isActive: state.selectedList == 0,
                                icon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ThemeSelector
                                          .statics.defaultMicroGap),
                                  child: SvgPicture.asset(
                                      'assets/images/online_chef_icon.svg'),
                                ),
                                onPressed: () {
                                  context
                                      .read<NewsBloc>()
                                      .add(const NewsEvent(selectedList: 0));
                                  controller.jumpToPage(0);
                                },
                                activeColor: ThemeSelector.colors.success,
                                notActiveColor: ThemeSelector.colors.background,
                                activeTextColor: ThemeSelector.colors.onSuccess,
                                notActiveTextColor:
                                    ThemeSelector.colors.secondary,
                              ),
                              ActionButton(
                                label: S.of(context).busy,
                                isActive: state.selectedList == 1,
                                icon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ThemeSelector
                                          .statics.defaultMicroGap),
                                  child: SvgPicture.asset(
                                      'assets/images/busy_chef_icon.svg'),
                                ),
                                onPressed: () {
                                  context
                                      .read<NewsBloc>()
                                      .add(const NewsEvent(selectedList: 1));
                                  controller.jumpToPage(1);
                                },
                                activeColor: ThemeSelector.colors.primary,
                                notActiveColor: ThemeSelector.colors.background,
                                activeTextColor: ThemeSelector.colors.onPrimary,
                                notActiveTextColor:
                                    ThemeSelector.colors.secondary,
                              ),
                              ActionButton(
                                label: S.of(context).offline,
                                isActive: state.selectedList == 2,
                                icon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ThemeSelector
                                          .statics.defaultMicroGap),
                                  child: SvgPicture.asset(
                                      'assets/images/offline_chef_icon.svg'),
                                ),
                                onPressed: () {
                                  context
                                      .read<NewsBloc>()
                                      .add(const NewsEvent(selectedList: 2));
                                  controller.jumpToPage(2);
                                },
                                activeColor: ThemeSelector.colors.secondaryTant,
                                notActiveColor: ThemeSelector.colors.background,
                                activeTextColor:
                                    ThemeSelector.colors.onSecondary,
                                notActiveTextColor:
                                    ThemeSelector.colors.secondary,
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 190,
              child: menuTarget == MenuTarget.preOrder
                  ? _ChefListStatus(menuTarget: menuTarget)
                  : PageView(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _ChefListStatus(menuTarget: menuTarget, status: 1),
                        _ChefListStatus(menuTarget: menuTarget, status: 2),
                        _ChefListStatus(menuTarget: menuTarget, status: 0),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChefListStatus extends StatelessWidget {
  _ChefListStatus({required this.menuTarget, this.status});

  final MenuTarget menuTarget;
  final int? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChefsListBloc(),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.address != null
              ? PaginationTemplate(
                  scrollDirection: Axis.horizontal,
                  loadDate: () {
                    context.read<ChefsListBloc>().add(GetChefsListEvent(
                        context: context,
                        status: status,
                        menuTarget: menuTarget));
                  },
                  child: BlocConsumer<ChefsListBloc, ChefsListState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: Row(
                          children: [
                            for (var chef in state.chefs)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ThemeSelector.statics.defaultGap),
                                child: ChefBanner(
                                  menuTarget: menuTarget,
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
                            if (state.paginationHelper.isLoading) Loading(),
                            if (state.chefs.isEmpty)
                              SizedBox(
                                height: ThemeSelector
                                        .statics.defaultImageHeightSmall +
                                    ThemeSelector.statics.defaultMediumGap,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text('Please Select Location'),
                );
        },
      ),
    );
  }
}
