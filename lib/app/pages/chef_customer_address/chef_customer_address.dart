import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/auth/registeration/model/address.dart';
import 'package:yumi/bloc/address/address_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/google_maps_template.dart';
import 'package:yumi/util/map_util.dart';

@RoutePage()
class ChefCustomerAddressScreen extends StatelessWidget {
  ChefCustomerAddressScreen(
      {super.key, this.isChef = true, required this.id, this.address});

  final bool isChef;
  final String id;

  Address? address;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressBloc(),
      child: Builder(builder: (context) {
        if (address == null) {
          context
              .read<AddressBloc>()
              .add(AddressEvent.getAddressListEvent(context: context, id: id));
        }

        return BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            print('ChefCustomerAddressScreen ..............................');
            print(state.addressList);
            print(address);
            if (address == null) {
              address = state.addressList
                  .firstWhereOrNull((e) => e.isDefault == true);

              print(address);
            }
            return Stack(
              children: [
                if (address != null)
                  GoogleMapsTemplate(
                    loadingChild:
                        SvgPicture.asset('assets/images/delivery_on_road.svg'),
                    target: address,
                  ),
                if (address == null)
                  Container(
                    child: Center(
                      child: Loading(),
                    ),
                  ),
                Positioned(
                  left: ThemeSelector.statics.defaultTitleGap,
                  right: ThemeSelector.statics.defaultTitleGap,
                  bottom: ThemeSelector.statics.defaultMediumGap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultTitleGap,
                      vertical: ThemeSelector.statics.defaultBlockGap,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeSelector.colors.background,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultInputGap),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              isChef
                                  ? S.of(context).chef
                                  : S.of(context).customer,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(": ",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(address?.name ?? address?.userName ?? '',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultInputGap),
                        Row(
                          children: [
                            Text(
                              S.of(context).mobile,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(": ",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(address?.mobile ?? '',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultInputGap),
                        Text(
                          address?.location ?? address?.addressTitle ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultInputGap),
                        TextButton(
                            style: ButtonStyle(
                              minimumSize: WidgetStateProperty.resolveWith(
                                (states) => Size(double.maxFinite,
                                    ThemeSelector.statics.defaultTitleGap),
                              ),
                              backgroundColor: WidgetStateColor.resolveWith(
                                  (s) => ThemeSelector.colors.primary),
                            ),
                            onPressed: address?.latitude == null ||
                                    address?.longitude == null
                                ? null
                                : () {
                                    MapUtils.openMap(address!.latitude!,
                                        address!.longitude!);
                                  },
                            child: Text(
                              S.of(context).continue0,
                              style: Theme.of(context).textTheme.displaySmall,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
