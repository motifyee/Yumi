import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yumi/app/core/setup/awesome_notifications.dart';
import 'package:yumi/app/pages/chef_application/documentation/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/chef_application/documentation/cubit/docs_info.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/extensions/color.dart';
import 'package:yumi/global.dart';
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
              const SizedBox(),
              BlocBuilder<DocsCubit, DocsState>(
                builder: (context, state) {
                  final profile = G.rd<ProfileCubit>().state.form;

                  if (profile.guid.isEmpty) {
                    context.read<DocsCubit>().init();
                  }

                  return state.status.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : documentWidgets(context, state, profile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DocInfo> get data => G.isChefApp ? chefDocsInfo : driverDocsInfo;

  Widget documentWidgets(
      BuildContext context, DocsState state, Profile profile) {
    Future<String?> Function()? preAction(DocInfo e) {
      if (e.targets == null) return null;

      return () => showDialog(
            context: context,
            builder: (ctx) => FractionallySizedBox(
              widthFactor: .85,
              heightFactor: .3,
              child: Material(
                child: Container(
                  // height: 40,
                  constraints: const BoxConstraints(maxHeight: 60),
                  padding: EdgeInsets.symmetric(
                      vertical: ThemeSelector.statics.defaultGap,
                      horizontal: ThemeSelector.statics.defaultGap),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1),
                    color: ThemeSelector.colors.background,
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultBorderRadiusMedium),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: e.targets!
                          .map((e) => TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, e.option),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    e.option,
                                    style: TextStyle(
                                      color: ThemeSelector.colors.primary,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          );
    }

    var children = data
        .mapIndexed(
          (i, e) => documentWidget(
            context: context,
            hexBg: e.color,
            positionedIdx: i,
            title: e.title,
            data: () {
              var res = e.getdata(profile);
              return res;
            }(),
            desc: e.desc,
            loading: state.docsStatuses[i]?.isLoading ?? false,
            enabled: !state.isUploading,
            preAction: preAction(e),
            uploadAction: (String image, String? target) {
              if (e.update != null) {
                return G.rd<DocsCubit>().update(e.update!(profile, image), 0);
              }

              var updater = e.targets!
                  .firstWhereOrNull((e) => e.option == target)
                  ?.update;

              if (updater == null) return;

              G.rd<DocsCubit>().update(updater(profile, image), 0);
            },
          ),
        )
        .toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 670),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: children,
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

Future<String> _createFileFromString(String data, String? fileName) async {
  var p = await Permission.storage.request();
  if (p.isDenied) p = await Permission.manageExternalStorage.request();
  if (p.isDenied) return '';

  Uint8List bytes = base64.decode(data);

  // final path = (await getApplicationDocumentsDirectory()).path;
  var path = '/storage/emulated/0/Download/';
  if (Platform.isWindows) path = Directory.current.path;
  String fileName0 = fileName ?? "${DateTime.now().millisecondsSinceEpoch}.jpg";

  File file = File("$path/$fileName0");
  await file.writeAsBytes(bytes);

  NotificationService.showNotification(title: "Download File", body: fileName0);

  return file.path;
}

Widget documentWidget({
  BuildContext? context,
  String? hexBg,
  int? positionedIdx,
  String? title,
  String? desc,
  String? data,
  String? fileName,
  bool loading = false,
  bool enabled = true,
  //
  Future<String?> Function()? preAction,
  required void Function(String, String?) uploadAction,
}) {
  var titleWdg = Container(
    width: double.infinity,
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.only(left: 30),
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
    padding: const EdgeInsets.only(left: 30, right: 30),
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

        if (preAction != null) {
          return preAction().then((target) async {
            if (target == null) return;

            ImagePicker imagePicker = ImagePicker();
            final image =
                await imagePicker.pickImage(source: ImageSource.gallery);
            if (image == null) return;

            var encoded =
                'data:${lookupMimeType(image.path)};base64,${base64Encode(await image.readAsBytes())}';

            uploadAction(encoded, target);

            if (context?.mounted ?? false) {
              // ignore: use_build_context_synchronously
              G.showToast("Uploaded $title", context: context);
            }
          });
        }

        ImagePicker imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) return;

        var encoded =
            'data:${lookupMimeType(image.path)};base64,${base64Encode(await image.readAsBytes())}';
        uploadAction(encoded, null);

        if (context?.mounted ?? false) {
          // ignore: use_build_context_synchronously
          G.showToast("Uploaded $title", context: context);
        }
      },
      child: const Text("Upload"),
    ),
  );
  var downloadButton = Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      onPressed: () async {
        _createFileFromString(data!, fileName);
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
      //
      // Icon
      Container(child: fileSvg(hexBg ?? "FFFFFF")),
      // Transform.scale(scale: 1.1, child: bg),
      //
      // Text
      filter(
        Column(
          children: [
            // if (title != null)
            SizedBox(height: (title == null ? 50 : 60)),
            if (title != null) titleWdg,
            const SizedBox(height: 5),
            desription,
          ],
        ),
      ),
      //
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
