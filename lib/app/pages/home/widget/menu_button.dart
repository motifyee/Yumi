import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/side_menu_items.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.menuItem});

  final AppMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    if (menuItem.onRender != null) menuItem.onRender!();
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size.fromHeight(CommonDimens.defaultTitleGap),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      onPressed: menuItem.onPressed,
      child: Row(
        children: [
          SizedBox(
            width: 15,
            height: 15,
            child: SvgPicture.asset(
              menuItem.icon,
            ),
          ),
          const SizedBox(width: CommonDimens.defaultGap),
          Text(
            menuItem.label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Expanded(child: Container()),
          if (menuItem.textLabel != null) menuItem.textLabel!,
        ],
      ),
    );
  }
}
