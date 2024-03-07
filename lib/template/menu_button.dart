import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/app_side_menu_items.dart';
import 'package:yumi/statics/theme_statics.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.menuItem});

  final AppMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.fromHeight(ThemeSelector.statics.defaultTitleGap),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      onPressed: menuItem.onPressed,
      child: Row(
        children: [
          SizedBox(
              width: 15,
              height: 15,
              child: SvgPicture.asset(
                menuItem.icon,
              )),
          SizedBox(width: ThemeSelector.statics.defaultGap),
          Text(
            menuItem.label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
