// ⌥ + Q
import 'package:common_code/common_code.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:yumi/global.dart';

Future<void> registerHotkeys() async {
  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.keyL,
      modifiers: [HotKeyModifier.shift],
      scope: HotKeyScope.inapp,
    ),
    keyDownHandler: (hotKey) => G().rd<AppCubit>().toggleLocale(),
  );

  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.keyQ,
      modifiers: [HotKeyModifier.shift],
      scope: HotKeyScope.inapp,
    ),
    keyDownHandler: (hotKey) => G().snackBar('!Q'),
  );
}
