import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/location.svg',
              width: ThemeStatics.iconSizeSmall,
              height: ThemeStatics.iconSizeSmall,
            ),
            SizedBox(width: ThemeStatics.defaultGap),
            Column(
              children: [
                Text(
                  '356-565 main St.',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Text(
                  'New York NY 23212',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: ThemeStatics.defaultGap),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/images/opened.svg'),
              SizedBox(width: ThemeStatics.defaultGap),
              Text(
                S.of(context).opened,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ],
    );
  }
}
