import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/customer_location/cubit/address_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/util/map_util.dart';

@RoutePage()
class ChefCustomerAddressScreen extends StatelessWidget {
  ChefCustomerAddressScreen({super.key, this.isChef = true, required this.id, this.address});

  final bool isChef;
  final String id;

  Address? address;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: Builder(builder: (context) {
        if (address == null) {
          context.read<AddressCubit>().getAddresses(id: id);
        }

        return BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            address ??= state.pagination.data.firstWhereOrNull((e) => e.isDefault == true);
            return Stack(
              children: [
                if (address != null)
                  GoogleMapsTemplate(
                    loadingChild: SvgPicture.asset('assets/images/delivery_on_road.svg'),
                    target: address,
                  ),
                if (address == null)
                  const Center(
                    child: Loading(),
                  ),
                if (address != null)
                  Positioned(
                    left: CommonDimens.defaultTitleGap,
                    right: CommonDimens.defaultTitleGap,
                    bottom: CommonDimens.defaultMediumGap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultTitleGap,
                        vertical: CommonDimens.defaultBlockGap,
                      ),
                      decoration: BoxDecoration(
                        color: CommonColors.background,
                        borderRadius: BorderRadius.circular(CommonDimens.defaultInputGap),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                isChef ? S.of(context).chef : S.of(context).customer,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(": ", style: Theme.of(context).textTheme.bodyMedium),
                              Text(address?.userName ?? address?.name ?? '', style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: CommonDimens.defaultInputGap),
                          Row(
                            children: [
                              Text(
                                S.of(context).mobile,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(": ", style: Theme.of(context).textTheme.bodyMedium),
                              Text(address?.mobile ?? '', style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: CommonDimens.defaultInputGap),
                          Text(
                            address?.location ?? address?.addressTitle ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: CommonDimens.defaultInputGap),
                          TextButton(
                              style: ButtonStyle(
                                minimumSize: WidgetStateProperty.resolveWith(
                                  (states) => const Size(double.maxFinite, CommonDimens.defaultTitleGap),
                                ),
                                backgroundColor: WidgetStateColor.resolveWith((s) => CommonColors.primary),
                              ),
                              onPressed: address?.latitude == null || address?.longitude == null
                                  ? null
                                  : () {
                                      MapUtils.openMap(address!.latitude!, address!.longitude!);
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
