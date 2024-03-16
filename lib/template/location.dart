import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/location.svg',
          width: ThemeSelector.statics.iconSizeSmall,
          height: ThemeSelector.statics.iconSizeSmall,
        ),
        SizedBox(width: ThemeSelector.statics.defaultGap),
        Column(
          children: [
            Text(
              '356-565 main St.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ThemeSelector.colors.secondaryFaint,
                  ),
            ),
            Text(
              'New York NY 23212',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ThemeSelector.colors.secondaryFaint,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
