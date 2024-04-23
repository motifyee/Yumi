import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/app/pages/settings/profile/profile_screen.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/bio.dart';
import 'package:yumi/template/event_photo.dart';

class EditBioSheet extends StatelessWidget {
  const EditBioSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // !Bug build so much
    if (!G.read<ProfileBloc>().state.statusSet.hasInit) {
      context.read<ProfileBloc>().add(ProfileInitEvent(context: context));
    }

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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtraLarge),
            topLeft: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtraLarge),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        child: SizedBox(
          child: SingleChildScrollView(
            // child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {}),
            child: Column(
              children: [
                const ProfilePicture(),
                const Bio(),
                if (G.isChefApp) const SizedBox(height: 40),
                if (G.isChefApp) const EventsPhoto(),
                const SizedBox(height: 20),
                BlocSelector<ProfileBloc, ProfileState, bool>(
                  selector: (state) => state.profile.profileSheetDone,
                  builder: (context, profileSheetDone) {
                    return TextButton(
                      onPressed: () {
                        var state = G.read<ProfileBloc>().state;
                        if (!state.profile.profileSheetDone) return;

                        // G.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: 1));

                        Navigator.of(context).pop();
                        G.rd<RegCubit>().refresh();

                        // G.pop();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: profileSheetDone
                            ? ThemeSelector.colors.primary
                            : ThemeSelector.colors.secondary,
                      ),
                      child: const Text('Ok'),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
            // },
          ),
        ),
      ),
    );
  }
}
