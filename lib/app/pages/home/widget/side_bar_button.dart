import 'dart:async';

import 'package:common_code/common_code.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/generated/l10n.dart';

class SideBarButton extends StatefulWidget {
  const SideBarButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  State<SideBarButton> createState() => _SideBarButtonState();
}

class _SideBarButtonState extends State<SideBarButton> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1), (e) => mounted ? setState(() {}) : null);
  }

  Color signalRStateColor() {
    Color color = CommonColors.secondary;

    switch (Signalr.hubConnection?.state) {
      case HubConnectionState.Connected:
        color = CommonColors.success;
        break;
      case HubConnectionState.Reconnecting:
        color = CommonColors.primary;
        break;

      default:
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextButton(
          onPressed: () => widget.onPressed(),
          child: SvgPicture.asset(
            'assets/images/side_bar.svg',
            width: CommonDimens.iconSizeSmall,
            height: CommonDimens.iconSizeSmall,
            colorFilter: ColorFilter.mode(signalRStateColor(), BlendMode.srcIn),
          ),
        ),
        if (Signalr.hubConnection?.state != HubConnectionState.Connected)
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (!state.isLoggedIn) return const SizedBox();

              return Positioned(
                left: CommonDimens.defaultLineGap,
                bottom: CommonDimens.defaultGap,
                child: Text(S.of(context).disconnected,
                    style: Theme.of(context).textTheme.headlineSmall),
              );
            },
          ),
      ],
    );
  }
}
