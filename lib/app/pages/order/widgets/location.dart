import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/location.svg',
          width: CommonDimens.iconSizeSmall,
          height: CommonDimens.iconSizeSmall,
        ),
        const SizedBox(width: CommonDimens.defaultGap),
        BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                state.address?.location ?? state.address?.addressTitle ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: CommonColors.secondaryFaint,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
