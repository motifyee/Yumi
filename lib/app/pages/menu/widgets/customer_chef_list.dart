import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/loading.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/chef/chef_cubit.dart';
import 'package:yumi/domain/chef/entity/chef_work_status.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/chef_profile/components/chef_bannar.dart';

class CustomerChefList extends StatelessWidget {
  const CustomerChefList({super.key, required this.menuTarget});

  static PageController controller = PageController();
  final MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: Builder(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap * 2, vertical: CommonDimens.defaultGap),
              child: BlocBuilder<PageViewCubit, PageViewState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Container(
                        width: CommonDimens.defaultLineGap,
                        height: CommonDimens.defaultLineGap,
                        padding: const EdgeInsets.all(CommonDimens.defaultMicroGap),
                        decoration: BoxDecoration(color: CommonColors.secondary, borderRadius: BorderRadius.circular(CommonDimens.defaultBorderRadiusSmall)),
                        child: Center(
                          child: SvgPicture.asset('assets/images/profile1.svg'),
                        ),
                      ),
                      const Text(' '),
                      Text(
                        S.of(context).chefs,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: CommonFontSize.font_16,
                            ),
                      ),
                      if (menuTarget == MenuTarget.order)
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ActionButton(
                                  label: S.of(context).online,
                                  isActive: state.selectedList == 0,
                                  icon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
                                    child: SvgPicture.asset('assets/images/online_chef_icon.svg'),
                                  ),
                                  onPressed: () {
                                    context.read<PageViewCubit>().updateSelect(selectedList: 0);
                                    controller.jumpToPage(0);
                                  },
                                  activeColor: CommonColors.success,
                                  notActiveColor: CommonColors.background,
                                  activeTextColor: CommonColors.onSuccess,
                                  notActiveTextColor: CommonColors.secondary,
                                ),
                                ActionButton(
                                  label: S.of(context).busy,
                                  isActive: state.selectedList == 1,
                                  icon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
                                    child: SvgPicture.asset('assets/images/busy_chef_icon.svg'),
                                  ),
                                  onPressed: () {
                                    context.read<PageViewCubit>().updateSelect(selectedList: 1);
                                    controller.jumpToPage(1);
                                  },
                                  activeColor: CommonColors.primary,
                                  notActiveColor: CommonColors.background,
                                  activeTextColor: CommonColors.onPrimary,
                                  notActiveTextColor: CommonColors.secondary,
                                ),
                                ActionButton(
                                  label: S.of(context).offline,
                                  isActive: state.selectedList == 2,
                                  icon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultMicroGap),
                                    child: SvgPicture.asset('assets/images/offline_chef_icon.svg'),
                                  ),
                                  onPressed: () {
                                    context.read<PageViewCubit>().updateSelect(selectedList: 2);
                                    controller.jumpToPage(2);
                                  },
                                  activeColor: CommonColors.secondaryTant,
                                  notActiveColor: CommonColors.background,
                                  activeTextColor: CommonColors.onSecondary,
                                  notActiveTextColor: CommonColors.secondary,
                                ),
                              ],
                            ),
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
                        _ChefListStatus(
                          menuTarget: menuTarget,
                          workStatus: ChefWorkStatus.open,
                        ),
                        _ChefListStatus(
                          menuTarget: menuTarget,
                          workStatus: ChefWorkStatus.busy,
                        ),
                        _ChefListStatus(
                          menuTarget: menuTarget,
                          workStatus: ChefWorkStatus.offline,
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

class _ChefListStatus extends StatelessWidget {
  const _ChefListStatus({
    this.workStatus,
    required this.menuTarget,
  });

  final MenuTarget menuTarget;
  final ChefWorkStatus? workStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChefsCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return state.address != null
              ? PaginationTemplate(
                  scrollDirection: Axis.horizontal,
                  loadDate: () => context.read<ChefsCubit>().getChefs(
                        status: workStatus,
                        isPreOrder: menuTarget == MenuTarget.preOrder,
                      ),
                  child: BlocConsumer<ChefsCubit, ChefsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap),
                        child: Row(
                          children: [
                            for (var chef in state.chefs)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap),
                                child: ChefBanner(
                                  menuTarget: menuTarget,
                                  chef: chef,
                                  width: MediaQuery.of(context).size.width - (CommonDimens.defaultGap * 10),
                                  height: CommonDimens.defaultImageHeightSmall,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(CommonDimens.defaultBorderRadius),
                                    topRight: Radius.circular(CommonDimens.defaultBorderRadius),
                                  ),
                                ),
                              ),
                            if (state.chefsPagination.isLoading) const Loading(),
                            if (state.chefs.isEmpty)
                              const SizedBox(
                                height: CommonDimens.defaultImageHeightSmall + CommonDimens.defaultMediumGap,
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
