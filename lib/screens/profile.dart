import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/my_reviews.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileEvent(context: context));

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.profile.id == 0
            ? Loading()
            : Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: ThemeSelector.statics.defaultBorderRadiusExtreme,
                      height: ThemeSelector.statics.defaultBorderRadiusExtreme,
                      padding:
                          EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
                      decoration: BoxDecoration(
                        color: ThemeSelector.colors.onSecondary,
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultBorderRadiusExtreme),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/camera.svg',
                      ),
                    ),
                  ),
                  Text(
                    state.profile.fullName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultGap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('4.5',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(' ', style: Theme.of(context).textTheme.bodyMedium),
                      SvgPicture.asset('assets/images/star.svg'),
                      Text(' | ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(S.of(context).hygiene,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultTitleGap),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Bio(),
                          SizedBox(
                              height: ThemeSelector.statics.defaultBlockGap),
                          const EventsPhoto(),
                          SizedBox(
                              height: ThemeSelector.statics.defaultBlockGap),
                          const MyReviews(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
