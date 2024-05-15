import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
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
        BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state.address?.toJson());
            return SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                state.address?.location ?? state.address?.addressTitle ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ThemeSelector.colors.secondaryFaint,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
