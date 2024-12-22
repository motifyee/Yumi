import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';

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
            context.router.popForced();
          },
          child: Icon(
            Icons.arrow_back,
            color: CommonColors.primary,
          ),
        ),
        title: Text(
          S.of(context).tracking,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: CommonFontSize.font_16,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GoogleMapsTemplate(
                loadingChild:
                    SvgPicture.asset('assets/images/delivery_on_road.svg'),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                S.of(context).orderStatus,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: CommonFontSize.font_16,
                    ),
              ),
              Text(
                '${S.of(context).invoice}: 151515',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '${S.of(context).arrivesIn}: 13 ${S.of(context).minutes}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: CommonFontSize.font_16,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (!await launchUrl(
                        Uri(
                          scheme: 'tel',
                          path: '01015306632',
                        ),
                      )) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: SnackBarMassage(
                              massage: S.of(context).noAccessToDailSystem,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: CommonDimens.defaultBlockGap,
                      height: CommonDimens.defaultBlockGap,
                      padding:
                          const EdgeInsets.all(CommonDimens.defaultMicroGap),
                      decoration: BoxDecoration(
                        color: CommonColors.primary,
                        borderRadius: BorderRadius.circular(
                          CommonDimens.defaultBlockGap,
                        ),
                      ),
                      child: SvgPicture.asset('assets/images/calling.svg'),
                    ),
                  ),
                  const SizedBox(width: CommonDimens.defaultInputGap),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: CommonDimens.defaultBlockGap,
                      height: CommonDimens.defaultBlockGap,
                      padding:
                          const EdgeInsets.all(CommonDimens.defaultMicroGap),
                      decoration: BoxDecoration(
                        color: CommonColors.primary,
                        borderRadius: BorderRadius.circular(
                          CommonDimens.defaultBlockGap,
                        ),
                      ),
                      child: SvgPicture.asset('assets/images/chat.svg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CommonDimens.defaultGap),
              Hero(
                tag: 'ConfirmBasketSeries',
                child: GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                    width: CommonDimens.defaultGapXXXL * 1.6,
                    height: CommonDimens.defaultTitleGapLarge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        CommonDimens.defaultBorderRadius,
                      ),
                      color: CommonColors.primary,
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
              const SizedBox(height: CommonDimens.defaultBlockGap),
            ],
          ),
        ],
      ),
    );
  }
}
