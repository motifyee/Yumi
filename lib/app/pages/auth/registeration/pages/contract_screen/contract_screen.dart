import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/auth/registeration/pages/contract_screen/contract_image.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/docs_info.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/documentation_screen.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/screen_container.dart';

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
                  SvgPicture.asset(AppAssets.contractIcon),
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
                child: G.isChefApp
                    ? SvgPicture.asset(AppAssets.chefConrtactIcon)
                    : SvgPicture.asset(AppAssets.driverContractIcon),
              ),
              const SizedBox(height: 60),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (!G.rd<RegCubit>().state.registerationStarted &&
                      state.form.entityStatus.hasSuccess) {
                    context.read<ProfileCubit>().getProfileForm();
                  }
                  if (state.form.entityStatus.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  return Container(
                      child: buidlDocumentWidget(
                    // hexBg: "#F4F4F4",
                    // title: "Contract",
                    // desc: "Download the contract to sign it and upload it",
                    doc: DocInfo(
                      color: "F4F4F4",
                      title: "Contract",
                      desc: "Download the contract to sign it and upload it",
                      getdata: (_) => null,
                    ),
                    data: contractImage, //state.form.contractPhoto,
                    fileName: 'YUMI-contract.jpg',
                    uploadAction: (data, _) {
                      var c = context.read<ProfileCubit>();
                      c.updateProfileForm(
                          c.state.form.copyWith(contractPhoto: data));
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
