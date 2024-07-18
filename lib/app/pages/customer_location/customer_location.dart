import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/auth/registeration/pages/location_screen/location_screen.dart';
import 'package:yumi/app/pages/customer_location/cubit/address/address_bloc.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/app/yumi/config/chef/chef_routes.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';

@RoutePage()
class CustomerLocationScreen extends StatelessWidget {
  const CustomerLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => context.router.replaceAll([HomeRoute()]),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * .3,
              ),
              child: Image.asset('assets/images/customer_location.png',
                  fit: BoxFit.fitWidth),
            ),
            const SizedBox(height: CommonDimens.defaultBlockGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).hello,
                    style: Theme.of(context).textTheme.titleLarge),
                const Text(' '),
                Text(context.read<UserCubit>().state.user.userName,
                    style: Theme.of(context).textTheme.titleLarge),
                Text(',', style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .35,
                  height: CommonDimens.defaultMicroGap,
                  decoration: BoxDecoration(color: CommonColors.secondary),
                ),
                const SizedBox(width: CommonDimens.defaultMicroGap),
                Container(
                  width: CommonDimens.defaultMicroGap,
                  height: CommonDimens.defaultMicroGap,
                  decoration: BoxDecoration(color: CommonColors.primary),
                ),
              ],
            ),
            const SizedBox(height: CommonDimens.defaultBlockGap),
            SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: Text(
                S
                    .of(context)
                    .pleaseEnterYourLocationOrAllowAccessToYourLocationToFindChefsNearYou,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: CommonDimens.defaultGap),
            Expanded(
                child: BlocProvider(
              create: (context) => AddressBloc(),
              child: BlocConsumer<AddressBloc, AddressState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultMediumGap),
                    child: PaginationTemplate(
                      scrollDirection: Axis.vertical,
                      loadDate: () {
                        context.read<AddressBloc>().add(
                            AddressEvent.getAddressListEvent(context: context));
                      },
                      child: Column(
                        children: [
                          if (state.pagination.isLoading)
                            const PacmanLoadingWidget(),
                          if (!state.pagination.isLoading)
                            for (var i = 0; i < state.addressList.length; i++)
                              if (state.addressList[i].isDeleted != true)
                                _LocationCard(address: state.addressList[i]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    context.router.replaceAll([HomeRoute()]);
                  },
                  child: Container(
                    width: CommonDimens.buttonWidth,
                    height: CommonDimens.defaultTitleGapLarge,
                    padding: const EdgeInsets.all(CommonDimens.defaultGap),
                    decoration: BoxDecoration(
                        color: CommonColors.primary,
                        borderRadius: BorderRadius.circular(
                            CommonDimens.buttonBorderRadius)),
                    child: Center(
                      child: Text(
                        S.of(context).confirmLocation,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LocationScreen(
                              routeFn: ({Address? address}) {
                                G().rd<UserCubit>().saveLocation(address!);

                                context.router.replaceAll([HomeRoute()]);
                              },
                              isBack: true,
                            )));
                  },
                  child: Container(
                    width: CommonDimens.buttonWidth,
                    height: CommonDimens.defaultTitleGapLarge,
                    padding: const EdgeInsets.all(CommonDimens.defaultGap),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: CommonColors.secondary, width: 1),
                      borderRadius: BorderRadius.circular(
                          CommonDimens.buttonBorderRadius),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          padding:
                              const EdgeInsets.all(CommonDimens.defaultGap),
                          decoration: BoxDecoration(
                            color: CommonColors.secondary,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: SvgPicture.asset('assets/images/location.svg',
                              fit: BoxFit.fill),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              S.of(context).searchOrEnterAnAddress,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 27,
                          height: 27,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CommonDimens.defaultBlockGap),
          ],
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonDimens.defaultMicroGap,
          vertical: CommonDimens.defaultMicroGap),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: CommonDimens.defaultGap,
            ),
            height: CommonDimens.defaultTitleGapLarge,
            decoration: BoxDecoration(
              color: CommonColors.primary
                  .withAlpha(address.isDefault == true ? 255 : 100),
              borderRadius:
                  BorderRadius.circular(CommonDimens.defaultBorderRadiusMedium),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: address.isDefault == true
                        ? null
                        : () {
                            context.read<AddressBloc>().add(
                                  AddressEvent.editAddressEvent(
                                    context: context,
                                    address: address.copyWith(isDefault: true),
                                  ),
                                );
                          },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultGap,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: CommonDimens.defaultGap),
                                child: SvgPicture.asset(
                                  'assets/images/location_indecator.svg',
                                  height: CommonFontSize.font_12,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  address.addressTitle ?? '',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (address.isDefault != true)
                  InkWell(
                    onTap: () {
                      context.read<AddressBloc>().add(
                            AddressEvent.deleteAddressEvent(
                              context: context,
                              address: address,
                            ),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: CommonDimens.defaultGap,
                          vertical: CommonDimens.defaultGap),
                      child: Icon(
                        Icons.delete,
                        color: CommonColors.onPrimary,
                        size: CommonFontSize.font_16,
                      ),
                    ),
                  )
              ],
            ),
          ),
          if (address.isDefault == true)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: CommonDimens.defaultGap),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(CommonDimens.defaultGap),
                    child: SvgPicture.asset(
                      'assets/images/location_indecator.svg',
                      height: CommonFontSize.font_12,
                      colorFilter: ColorFilter.mode(
                          CommonColors.secondary, BlendMode.srcIn),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    address.location ?? '',
                    softWrap: true,
                  )),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
