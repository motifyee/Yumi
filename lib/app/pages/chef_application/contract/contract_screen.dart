import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/app/pages/chef_application/documentation/bloc/icon_bloc.dart';
import 'package:yumi/app/pages/chef_application/documentation/documentation_screen.dart';
import 'package:yumi/app/pages/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: G.rd<RegCubit>().state.registerationStarted
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
                bottomOpacity: 0,
                scrolledUnderElevation: 0,
                iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  SvgPicture.asset("assets/images/contract_icon.svg"),
                  const SizedBox(width: 30),
                  Text(
                    S.of(ctx).contract,
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeSelector.colors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Center(
                  child: SvgPicture.asset("assets/images/chef_contract.svg")),
              const SizedBox(height: 60),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (!G.rd<RegCubit>().state.registerationStarted &&
                      state.status.isInit) {
                    context
                        .read<ProfileBloc>()
                        .add(ProfileInitEvent(context: context));
                  }
                  if (state.status.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  return Container(
                      child: documentWidget(
                    hexBg: "#F4F4F4",
                    title: "Contract",
                    desc: "Download the contract to sign it and upload it",
                    data: state.profile.contractPhoto,
                    fileName: 'YUMI-contract.pdf',
                    uploadAction: (data, _) => {
                      context.read<ProfileBloc>().add(
                            ProfileUpdateEvent(
                              update: false,
                              context: context,
                              profile:
                                  state.profile.copyWith(contractPhoto: data),
                            ),
                          ),
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
