import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/auth/registeration/pages/location_screen/location_screen.dart';
import 'package:yumi/app/pages/customer_location/cubit/address/address_bloc.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/pagination_template.dart';

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
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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
                  height: ThemeSelector.statics.defaultMicroGap,
                  decoration:
                      BoxDecoration(color: ThemeSelector.colors.secondary),
                ),
                SizedBox(width: ThemeSelector.statics.defaultMicroGap),
                Container(
                  width: ThemeSelector.statics.defaultMicroGap,
                  height: ThemeSelector.statics.defaultMicroGap,
                  decoration:
                      BoxDecoration(color: ThemeSelector.colors.primary),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Expanded(
                child: BlocProvider(
              create: (context) => AddressBloc(),
              child: BlocConsumer<AddressBloc, AddressState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultMediumGap),
                    child: PaginationTemplate(
                      scrollDirection: Axis.vertical,
                      loadDate: () {
                        context.read<AddressBloc>().add(
                            AddressEvent.getAddressListEvent(context: context));
                      },
                      child: Column(
                        children: [
                          if (state.pagination.isLoading) Loading(),
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
                    width: ThemeSelector.statics.buttonWidth,
                    height: ThemeSelector.statics.defaultTitleGapLarge,
                    padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                    decoration: BoxDecoration(
                        color: ThemeSelector.colors.primary,
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.buttonBorderRadius)),
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
                                G.rd<UserCubit>().saveLocation(address!);

                                context.router.replaceAll([HomeRoute()]);
                              },
                              isBack: true,
                            )));
                  },
                  child: Container(
                    width: ThemeSelector.statics.buttonWidth,
                    height: ThemeSelector.statics.defaultTitleGapLarge,
                    padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ThemeSelector.colors.secondary, width: 1),
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.buttonBorderRadius),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          padding:
                              EdgeInsets.all(ThemeSelector.statics.defaultGap),
                          decoration: BoxDecoration(
                            color: ThemeSelector.colors.secondary,
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
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
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
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultMicroGap,
          vertical: ThemeSelector.statics.defaultMicroGap),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultGap,
            ),
            height: ThemeSelector.statics.defaultTitleGapLarge,
            decoration: BoxDecoration(
              color: ThemeSelector.colors.primary
                  .withAlpha(address.isDefault == true ? 255 : 100),
              borderRadius: BorderRadius.circular(
                  ThemeSelector.statics.defaultBorderRadiusMedium),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultGap,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ThemeSelector.statics.defaultGap),
                                child: SvgPicture.asset(
                                  'assets/images/location_indecator.svg',
                                  height: ThemeSelector.fonts.font_12,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: ThemeSelector.statics.defaultGap,
                          vertical: ThemeSelector.statics.defaultGap),
                      child: Icon(
                        Icons.delete,
                        color: ThemeSelector.colors.onPrimary,
                        size: ThemeSelector.fonts.font_16,
                      ),
                    ),
                  )
              ],
            ),
          ),
          if (address.isDefault == true)
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ThemeSelector.statics.defaultGap),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                    child: SvgPicture.asset(
                      'assets/images/location_indecator.svg',
                      height: ThemeSelector.fonts.font_12,
                      colorFilter: ColorFilter.mode(
                          ThemeSelector.colors.secondary, BlendMode.srcIn),
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