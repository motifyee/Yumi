import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/features/settings/profile/profile_screen.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';

class EditBioSheet extends StatelessWidget {
  const EditBioSheet({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileInitEvent(context: context));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.only(
          left: ThemeSelector.statics.defaultBlockGap,
          right: ThemeSelector.statics.defaultBlockGap,
          top: ThemeSelector.statics.defaultGapExtreme,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          border: Border.all(),
          borderRadius: BorderRadius.only(
            topRight:
                Radius.circular(ThemeSelector.statics.defaultBorderRadiusLarge),
            topLeft:
                Radius.circular(ThemeSelector.statics.defaultBorderRadiusLarge),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        child: const SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePicture(),
                Bio(),
                SizedBox(height: 160),
                EventsPhoto(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
