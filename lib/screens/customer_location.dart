import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/address/address_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/features/registeration/model/address.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';

@RoutePage()
class CustomerLocationScreen extends StatelessWidget {
  const CustomerLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/customer_location.png',
                fit: BoxFit.fitWidth),
          ),
          SizedBox(height: ThemeSelector.statics.defaultBlockGap),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).hello,
                  style: Theme.of(context).textTheme.titleLarge),
              Text(' '),
              Text(context.read<UserBloc>().state.user.userName,
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
                decoration: BoxDecoration(color: ThemeSelector.colors.primary),
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultBlockGap),
          Container(
            width: MediaQuery.of(context).size.width * .75,
            child: Text(
              S
                  .of(context)
                  .pleaseEnterYourLocationOrAllowAccessToYourLocationToFndRestaurantsNearYou,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
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
                          AddressEvent.updateAddressListEvent(
                              context: context));
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                for (var i = 0;
                                    i < state.addressList.length;
                                    i += 3)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ThemeSelector
                                            .statics.defaultMicroGap),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ThemeSelector.statics.defaultGap,
                                        vertical:
                                            ThemeSelector.statics.defaultGap,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ThemeSelector.colors.primary
                                            .withAlpha(100),
                                        borderRadius: BorderRadius.circular(
                                            ThemeSelector.statics
                                                .defaultBorderRadiusMedium),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/location_indecator.svg'),
                                          Text('  '),
                                          Expanded(
                                            child: Text(
                                              state.addressList[i]
                                                      .addressTitle ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall
                                                  ?.copyWith(
                                                      fontSize: ThemeSelector
                                                          .fonts.font_9),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        )
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
                onPressed: () {},
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
                  context.router.push(
                    LocationRoute(routeFn: ({Address? address}) {
                      context
                          .read<UserBloc>()
                          .add(UserUpdateLocationEvent(address: address!));
                      context.router.replaceAll([HomeRoute()]);
                    }),
                  );
                },
                child: Container(
                  width: ThemeSelector.statics.buttonWidth,
                  height: ThemeSelector.statics.defaultTitleGapLarge,
                  padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ThemeSelector.colors.secondary, width: 1),
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.buttonBorderRadius)),
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
                      Container(
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
    );
  }
}