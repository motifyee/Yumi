import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/screens/customer/chef_profile.dart';
import 'package:yumi/service/chef_service.dart';
import 'package:yumi/statics/theme_statics.dart';

class ChefBanner extends StatefulWidget {
  ChefBanner({
    super.key,
    required this.chef,
    required this.borderRadius,
    required this.width,
    required this.menuTarget,
    this.height,
    this.isShowFav = false,
    this.isProfileClick = true,
  });

  Chef chef;
  final BorderRadius borderRadius;
  final double width;
  final double? height;
  final MenuTarget menuTarget;
  final bool isShowFav;
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
      ChefService.getIsChefFavorite(chefId: widget.chef.id!)
          .then((value) => setState(() {
                widget.chef = widget.chef
                    .copyWith(isFavorite: value.data['data'].isNotEmpty);
                isLoading = false;
              }))
          .catchError((onError) {
        isLoading = false;
      });
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
            backgroundColor: ThemeSelector.colors.background,
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
            height: widget.height ?? ThemeSelector.statics.defaultImageHeight,
            child: Stack(children: [
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
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/354.jpeg',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                  child: Row(
                    children: [
                      if (widget.menuTarget == MenuTarget.order)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap),
                          decoration: BoxDecoration(
                              color: ThemeSelector.colors.success,
                              borderRadius: BorderRadius.circular(ThemeSelector
                                  .statics.defaultBorderRadiusLarge)),
                          child: Text(
                            S.of(context).open,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      if (widget.chef.pickupOnly == true)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ThemeSelector.statics.defaultGap),
                          decoration: BoxDecoration(
                              color: ThemeSelector.colors.primary,
                              borderRadius: BorderRadius.circular(ThemeSelector
                                  .statics.defaultBorderRadiusLarge)),
                          child: Text(
                            S.of(context).pickUpOnly,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: widget.isShowFav
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      [widget.chef.firstName, widget.chef.lastName].join(' '),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: ThemeSelector.fonts.font_16,
                          ),
                    ),
                    Row(
                      children: [
                        RatingBar(
                          ignoreGestures: true,
                          initialRating: widget.chef.rate ?? 0,
                          allowHalfRating: true,
                          itemSize: ThemeSelector.fonts.font_24,
                          ratingWidget: RatingWidget(
                            empty: Icon(Icons.star_border,
                                color: ThemeSelector.colors.warning),
                            full: Icon(Icons.star,
                                color: ThemeSelector.colors.warning),
                            half: Icon(
                              Icons.star_half,
                              color: ThemeSelector.colors.warning,
                            ),
                          ),
                          onRatingUpdate: (value) {},
                        ),
                        Text(' | ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        if (widget.chef.isHygiene != true)
                          Text('${S.of(context).hygiene} -',
                              style: Theme.of(context).textTheme.bodyMedium),
                        if (widget.chef.isHygiene == true)
                          Text(S.of(context).hygieneCertified,
                              style: Theme.of(context).textTheme.bodyMedium),
                        if (widget.chef.isHygiene == true)
                          SvgPicture.asset('assets/images/certified_icon.svg'),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    if (isLoading)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultBlockGap),
                        child: Loading(
                            size: ThemeSelector.statics.defaultBlockGap),
                      ),
                    if (widget.isShowFav && !isLoading)
                      TextButton(
                        onPressed: () {
                          if (widget.chef.isFavorite != true) {
                            ChefService.addFavoriteChef(chefId: widget.chef.id!)
                                .then((value) => setState(() {
                                      widget.chef = widget.chef
                                          .copyWith(isFavorite: true);
                                    }));
                          } else {
                            ChefService.removeFavoriteChef(
                                    chefId: widget.chef.id!)
                                .then((value) => setState(() {
                                      widget.chef = widget.chef
                                          .copyWith(isFavorite: false);
                                    }));
                          }
                        },
                        child: widget.chef.isFavorite
                            ? SvgPicture.asset('assets/images/heart.svg',
                                colorFilter: ColorFilter.mode(
                                    ThemeSelector.colors.primary,
                                    BlendMode.srcIn),
                                fit: BoxFit.contain)
                            : SvgPicture.asset(
                                'assets/images/heart_outline.svg',
                                fit: BoxFit.contain),
                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
