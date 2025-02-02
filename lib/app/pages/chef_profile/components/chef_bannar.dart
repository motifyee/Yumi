import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/chef_profile/chef_profile.dart';

class ChefBanner extends StatefulWidget {
  ChefBanner({
    super.key,
    required this.chef,
    required this.borderRadius,
    required this.width,
    required this.menuTarget,
    this.height,
    this.isShowFav = false,
    this.isRequestStatus = false,
    this.isProfileClick = true,
  });

  Chef chef;
  final BorderRadius borderRadius;
  final double width;
  final double? height;
  final OrderType menuTarget;
  final bool isShowFav;
  final bool isRequestStatus;
  final bool isProfileClick;
  @override
  State<ChefBanner> createState() => _ChefBannerState();
}

class _ChefBannerState extends State<ChefBanner> {
  bool isLoading = false;

  @override
  void initState() {
    if (widget.isShowFav) {
      isLoading = true;

      final params = IsFavouriteChefParams(widget.chef.id!);
      IsFavouriteChef().call(params).then(
            (res) => res.fold(
              (l) => setState(() {
                isLoading = false;
              }),
              (r) {
                widget.chef = widget.chef.copyWith(isFavorite: r);
                setState(() {
                  isLoading = false;
                });
              },
            ),
          );
    }

    if (widget.isRequestStatus) {
      final wParams = GetChefWorkStatusParams(widget.chef.id!);
      GetChefWorkStatus().call(wParams).then(
            (res) => res.fold(
              (l) => null,
              (r) => widget.chef = widget.chef.copyWith(status: r.index),
            ),
          );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isProfileClick) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            backgroundColor: CommonColors.background,
            builder: (context) => ChefProfileScreen(
              chef: widget.chef,
              menuTarget: widget.menuTarget,
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.height ?? CommonDimens.defaultImageHeight,
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: widget.width,
                  decoration: BoxDecoration(borderRadius: widget.borderRadius),
                  child: Hero(
                    tag: 'chef_${widget.chef.id}',
                    child: SizedBox(
                      child: Image.memory(
                        Uri.parse(widget.chef.imageProfile ?? '')
                                .data
                                ?.contentAsBytes() ??
                            Uint8List(0),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/354.jpeg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(CommonDimens.defaultGap),
                    child: Row(
                      children: [
                        if (widget.chef.status == 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultGap,
                            ),
                            decoration: BoxDecoration(
                              color: CommonColors.primaryDisabled,
                              borderRadius: BorderRadius.circular(
                                CommonDimens.defaultBorderRadiusLarge,
                              ),
                            ),
                            child: Text(
                              S.of(context).offline,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        if (widget.chef.status == 1)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultGap,
                            ),
                            decoration: BoxDecoration(
                              color: CommonColors.success,
                              borderRadius: BorderRadius.circular(
                                CommonDimens.defaultBorderRadiusLarge,
                              ),
                            ),
                            child: Text(
                              S.of(context).open,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        if (widget.chef.status == 2)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultGap,
                            ),
                            decoration: BoxDecoration(
                              color: CommonColors.primaryDisabled,
                              borderRadius: BorderRadius.circular(
                                CommonDimens.defaultBorderRadiusLarge,
                              ),
                            ),
                            child: Text(
                              S.of(context).busy,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: widget.width,
            padding: const EdgeInsets.all(CommonDimens.defaultGap),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            [widget.chef.firstName, widget.chef.lastName]
                                .join(' '),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: CommonFontSize.font_16,
                                ),
                          ),
                          if (widget.isShowFav)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: CommonDimens.defaultGap,
                              ),
                              child: DeliveryPickUpIcons(
                                isPickUpOnly: widget.chef.pickupOnly ?? false,
                                isShowFav: widget.isShowFav,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBar(
                            ignoreGestures: true,
                            initialRating: widget.chef.rate ?? 0,
                            allowHalfRating: true,
                            itemSize: CommonFontSize.font_18,
                            ratingWidget: RatingWidget(
                              empty: Icon(
                                Icons.star_border,
                                color: CommonColors.warning,
                              ),
                              full:
                                  Icon(Icons.star, color: CommonColors.warning),
                              half: Icon(
                                Icons.star_half,
                                color: CommonColors.warning,
                              ),
                            ),
                            onRatingUpdate: (value) {},
                          ),
                          Text(
                            ' | ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: CommonFontSize.font_9),
                          ),
                          if (widget.chef.isHygiene != true)
                            Text(
                              '${S.of(context).hygiene} -',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: CommonFontSize.font_9,
                                  ),
                            ),
                          if (widget.chef.isHygiene == true)
                            Text(
                              S.of(context).hygieneCertified,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: CommonFontSize.font_9,
                                  ),
                            ),
                          if (widget.chef.isHygiene == true)
                            SvgPicture.asset(
                              'assets/images/certified_icon.svg',
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (!widget.isShowFav)
                  Transform.scale(
                    scale: 1.6,
                    child: DeliveryPickUpIcons(
                      isPickUpOnly: widget.chef.pickupOnly ?? false,
                      isShowFav: widget.isShowFav,
                    ),
                  ),
                if (widget.isShowFav)
                  Column(
                    children: [
                      if (isLoading)
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: CommonDimens.defaultBlockGap,
                          ),
                          child: PacmanLoadingWidget(
                            size: CommonDimens.defaultBlockGap,
                          ),
                        ),
                      if (!isLoading)
                        TextButton(
                          onPressed: () {
                            if (widget.chef.isFavorite != true) {
                              final aParams =
                                  AddFavouriteChefParams(widget.chef.id!);

                              AddFavouriteChef().call(aParams).then(
                                    (res) => res.fold(
                                      (l) => null,
                                      (r) => setState(() {
                                        widget.chef = widget.chef
                                            .copyWith(isFavorite: true);
                                      }),
                                    ),
                                  );
                            } else {
                              final rParams =
                                  RemoveFavouriteChefParams(widget.chef.id!);

                              RemoveFavouriteChef().call(rParams).then(
                                    (res) => res.fold(
                                      (l) => null,
                                      (r) => setState(() {
                                        widget.chef = widget.chef
                                            .copyWith(isFavorite: false);
                                      }),
                                    ),
                                  );
                            }
                          },
                          child: widget.chef.isFavorite
                              ? SvgPicture.asset(
                                  'assets/images/heart.svg',
                                  colorFilter: ColorFilter.mode(
                                    CommonColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.asset(
                                  'assets/images/heart_outline.svg',
                                  fit: BoxFit.contain,
                                ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryPickUpIcons extends StatelessWidget {
  const DeliveryPickUpIcons({
    super.key,
    required this.isShowFav,
    required this.isPickUpOnly,
  });

  final bool isShowFav;
  final bool isPickUpOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PickupIcon(showFav: isShowFav),
        const SizedBox(width: CommonDimens.defaultMicroGap),
        DeliveryIcon(showFav: isShowFav, isChecked: isPickUpOnly),
      ],
    );
  }
}

class DeliveryIcon extends StatelessWidget {
  const DeliveryIcon({
    super.key,
    required this.showFav,
    required this.isChecked,
  });

  final bool showFav;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          showFav ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/images/can_delivery_icon.svg'),
            if (showFav)
              Row(
                children: [
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    isChecked
                        ? 'assets/images/closed_icon.svg'
                        : 'assets/images/checked_icon.svg',
                  ),
                ],
              ),
          ],
        ),
        Text(
          S.of(context).delivery,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: CommonFontSize.font_5),
        ),
        if (!showFav)
          Row(
            children: [
              const SizedBox(height: 3),
              SvgPicture.asset(
                isChecked
                    ? 'assets/images/closed_icon.svg'
                    : 'assets/images/checked_icon.svg',
              ),
            ],
          ),
      ],
    );
  }
}

class PickupIcon extends StatelessWidget {
  const PickupIcon({
    super.key,
    required this.showFav,
  });

  final bool showFav;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          showFav ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/images/can_pickUp_icon.svg'),
            if (showFav)
              Row(
                children: [
                  const SizedBox(width: 3),
                  SvgPicture.asset('assets/images/checked_icon.svg'),
                ],
              ),
          ],
        ),
        Text(
          S.of(context).pickup,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: CommonFontSize.font_5),
        ),
        if (!showFav)
          Row(
            children: [
              const SizedBox(height: 5),
              SvgPicture.asset('assets/images/checked_icon.svg'),
            ],
          ),
      ],
    );
  }
}
