import 'dart:convert';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/extensions/color.dart';
import 'package:yumi/features/chef_application/application_flow_screen.dart';
import 'package:yumi/features/chef_application/documentation/bloc/documentation_bloc.dart';
import 'package:yumi/features/settings/profle/bloc/profile_bloc.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
                  SvgPicture.asset("assets/images/files.svg"),
                  const SizedBox(width: 40),
                  Text(
                    "Documents",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeSelector.colors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 140),
                child: SvgPicture.asset("assets/images/documents-icon.svg"),
              ),
              BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state.status.isInitSucces) {
                    context
                        .read<DocsBloc>()
                        .add(DocsInitSuccessEvent(state.profile));
                  }

                  if (state.status.isInitError) {
                    context.read<DocsBloc>().add(const DocsInitFailedEvent());
                  }

                  var docsBloc = context.read<DocsBloc>();
                  var docs = docsBloc.state;
                  if (state.status.isSuccess) {
                    if (docs.hygieneStatus.isLoading) {
                      docsBloc.add(UploadHygieneSuccessEvent());
                    } else if (docs.registerationStatus.isLoading) {
                      docsBloc.add(UploadRegisterationSuccessEvent());
                    } else if (docs.riskStatus.isLoading) {
                      docsBloc.add(UploadRiskSuccessEvent());
                    } else if (docs.idStatus.isLoading) {
                      docsBloc.add(UploadIDSuccessEvent());
                    }
                  }

                  if (state.status.isError) {
                    if (docs.hygieneStatus.isLoading) {
                      docsBloc.add(UploadHygieneErrorEvent());
                    } else if (docs.registerationStatus.isLoading) {
                      docsBloc.add(UploadRegisterationErrorEvent());
                    } else if (docs.riskStatus.isLoading) {
                      docsBloc.add(UploadRiskErrorEvent());
                    } else if (docs.idStatus.isLoading) {
                      docsBloc.add(UploadIDErrorEvent());
                    }
                  }
                },
                child: const SizedBox(),
              ),
              BlocConsumer<DocsBloc, DocsState>(
                listener: (context, state) {
                  if (state.isUploadingAPhoto) {
                    context.read<ProfileBloc>().add(
                          ProfileUpdateEvent(
                              context: context, profile: state.profile),
                        );
                  } else if (state.finished) {
                    context.router.pop();
                  }
                },
                builder: (context, state) {
                  if (state.status.isInit) {
                    context.read<DocsBloc>().add(DocsInitEvent());
                    context
                        .read<ProfileBloc>()
                        .add(ProfileInitEvent(context: context));
                  }

                  return state.status.isLoading
                      ? Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : documentWidgets(context, state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const List data = [
    {"title": 'Hygiene Certificate', "desc": 'You must obtain level two'},
    {"title": 'Local Authority Registration', "desc": ''},
    {"title": 'Risk Assessment', "desc": ''},
    {
      "title": 'ID/Passport copy',
      "desc":
          'The passport must be of British or Irish nationality and valid for at least 6 months'
    },
  ];

  Widget documentWidgets(BuildContext context, DocsState state) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 470),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          documentWidget(
            hexBg: "#F4F4F4",
            positionedIdx: 0,
            title: data[0]['title'],
            data: state.profile.hygienePhoto,
            desc: data[0]['desc'],
            loading: state.hygieneStatus.isLoading,
            enabled: !state.isUploadingAPhoto,
            uploadAction: (data) =>
                context.read<DocsBloc>().add(UploadHygieneEvent(data)),
          ),
          documentWidget(
            hexBg: "#EDEDED",
            positionedIdx: 1,
            title: data[1]['title'],
            data: state.profile.registerationPhoto,
            desc: data[01]['desc'],
            loading: state.registerationStatus.isLoading,
            enabled: !state.isUploadingAPhoto,
            uploadAction: (data) =>
                context.read<DocsBloc>().add(UploadRegisterationEvent(data)),
          ),
          documentWidget(
            hexBg: "#E0E0E0",
            positionedIdx: 2,
            title: data[02]['title'],
            desc: data[02]['desc'],
            data: state.profile.riskPhoto,
            loading: state.riskStatus.isLoading,
            enabled: !state.isUploadingAPhoto,
            uploadAction: (data) =>
                context.read<DocsBloc>().add(UploadRiskEvent(data)),
          ),
          documentWidget(
            hexBg: "#687C8E",
            positionedIdx: 03,
            title: data[03]['title'],
            desc: data[03]['desc'],
            data: state.profile.idPhoto,
            loading: state.idStatus.isLoading,
            enabled: !state.isUploadingAPhoto,
            uploadAction: (data) =>
                context.read<DocsBloc>().add(UploadIDEvent(data)),
          ),
        ],
      ),
    );
  }
}

Widget fileSvg(String hexColor) {
  Widget svgPicture(String color) => SvgPicture.asset(
        "assets/images/docs_file.svg",
        colorFilter:
            ColorFilter.mode(HexColor.fromHex(color), BlendMode.srcATop),
      );

  return IgnorePointer(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          // scaleX: 1.03,
          scaleY: 1.05,
          child: Transform.translate(
            offset: const Offset(2, 2),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 0,
                sigmaY: 2,
                tileMode: TileMode.clamp,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                child: Opacity(
                  opacity: 0.1,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      HexColor.fromHex("22000000"),
                      BlendMode.srcATop,
                    ),
                    child: svgPicture(hexColor),
                  ),
                ),
              ),
            ),
          ),
        ),
        svgPicture(hexColor),
      ],
    ),
  );
}

Widget documentWidget({
  String? hexBg,
  int? positionedIdx,
  String? title,
  String? desc,
  String? data,
  bool loading = false,
  bool enabled = true,
  required Function(String) uploadAction,
}) {
  var titleWdg = Container(
    width: double.infinity,
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.only(left: 70),
    margin: const EdgeInsets.all(0),
    child: Text(
      title ?? "",
      style: TextStyle(
        fontSize: 14,
        color: ThemeSelector.colors.secondary,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  var desription = Container(
    width: double.infinity,
    alignment: Alignment.topLeft,
    // decoration: BoxDecoration(border: Border.all()),
    padding: const EdgeInsets.only(left: 70, right: 10),
    child: Text(
      desc ?? "",
      style: TextStyle(
        fontSize: 10,
        color: ThemeSelector.colors.secondaryTantLighter,
        fontWeight: FontWeight.w400,
      ),
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      textWidthBasis: TextWidthBasis.longestLine,
    ),
  );
  var uploadButton = Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: enabled
            ? ThemeSelector.colors.primary
            : ThemeSelector.colors.secondary,
      ),
      onPressed: () async {
        if (!enabled) return;

        ImagePicker imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        uploadAction(base64Encode(await image.readAsBytes()));
      },
      child: const Text("Upload"),
    ),
  );
  var downloadButton = Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      onPressed: () async {
        print(data);
      },
      child: Row(children: [
        SvgPicture.asset("assets/images/download_icon.svg"),
        const SizedBox(width: 7),
        const Text(
          "Download",
        ),
      ]),
    ),
  );

  double sig = loading ? 2 : 0;
  Widget filter(Widget child) => ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: sig,
          sigmaY: sig,
        ),
        child: child,
      );

  var docStack = Stack(
    // fit: StackFit.expand,
    children: [
      // Icon
      Container(child: fileSvg(hexBg ?? "FFFFFF")),
      // Transform.scale(scale: 1.1, child: bg),
      // Text
      filter(Column(
        children: [
          const SizedBox(height: 60),
          titleWdg,
          const SizedBox(height: 5),
          desription,
        ],
      )),
      // Buttons
      Positioned(
        right: 22,
        bottom: 15,
        child: filter(SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (data != null) downloadButton,
              const SizedBox(width: 0),
              uploadButton,
            ],
          ),
        )),
      ),
      if (loading)
        const Center(
          child: CircularProgressIndicator(),
        )
    ],
  );

  if (positionedIdx == null) {
    return SizedBox(
      height: 155,
      width: 340,
      child: docStack,
    );
  }

  return Positioned(
    top: (105 * positionedIdx).toDouble(),
    height: 155,
    width: 340,
    child: docStack,
  );
}

// =============================================================================
/**
 * Filters:
 * =======
 * 
 * - filter child only: `FilteredImage`
 * - filter whole container but your widget: `BackdropFilter`
 */