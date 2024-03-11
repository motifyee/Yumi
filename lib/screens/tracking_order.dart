import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

@RoutePage()
class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: ThemeSelector.colors.primary,
            )),
        title: Text(
          S.of(context).tracking,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: ThemeSelector.fonts.font_16,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: SvgPicture.asset('assets/images/delivery_on_road.svg'),
          )),
          Column(
            children: [
              Text(
                S.of(context).orderStatus,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              Text(
                '${S.of(context).invoice}: 151515',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '${S.of(context).arrivesIn}: 13 ${S.of(context).minutes}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: ThemeSelector.fonts.font_16,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: ThemeSelector.statics.defaultBlockGap,
                      height: ThemeSelector.statics.defaultBlockGap,
                      padding:
                          EdgeInsets.all(ThemeSelector.statics.defaultMicroGap),
                      decoration: BoxDecoration(
                          color: ThemeSelector.colors.primary,
                          borderRadius: BorderRadius.circular(
                              ThemeSelector.statics.defaultBlockGap)),
                      child: SvgPicture.asset('assets/images/calling.svg'),
                    ),
                  ),
                  SizedBox(width: ThemeSelector.statics.defaultInputGap),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: ThemeSelector.statics.defaultBlockGap,
                      height: ThemeSelector.statics.defaultBlockGap,
                      padding:
                          EdgeInsets.all(ThemeSelector.statics.defaultMicroGap),
                      decoration: BoxDecoration(
                          color: ThemeSelector.colors.primary,
                          borderRadius: BorderRadius.circular(
                              ThemeSelector.statics.defaultBlockGap)),
                      child: SvgPicture.asset('assets/images/chat.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Hero(
                tag: 'ConfirmCartSeries',
                child: GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                    width: ThemeSelector.statics.defaultGapXXXL * 1.6,
                    height: ThemeSelector.statics.defaultTitleGapLarge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadius),
                      color: ThemeSelector.colors.primary,
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).orderDetails,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            ],
          ),
        ],
      ),
    );
  }
}
