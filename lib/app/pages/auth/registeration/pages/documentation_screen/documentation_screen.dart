import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:common_code/core/setup/awesome_notifications.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/docs_info.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

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
                  SvgPicture.asset(AppAssets.filesIcon),
                  const SizedBox(width: 40),
                  Text(
                    S.of(context).documentation,
                    style: TextStyle(
                      fontSize: 14,
                      color: CommonColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 140),
                child: SvgPicture.asset(AppAssets.documentsIcon),
              ),
              const SizedBox(),
              BlocBuilder<DocsCubit, DocsState>(
                builder: (context, state) {
                  final profile = G().rd<ProfileCubit>().state.form;

                  if (profile.guid.isEmpty) {
                    context.read<DocsCubit>().init();
                  }

                  return state.status.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : buildDocumentWidgets(context, state, profile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DocInfo> get data => G().isChefApp ? chefDocsInfo : driverDocsInfo;

  Widget buildDocumentWidgets(
    BuildContext context,
    DocsState state,
    Profile profile,
  ) {
    final children = data
        .mapIndexed(
          (idx, doc) => buidlDocumentWidget(
            context: context,
            positionedIdx: idx,
            doc: doc,
            data: doc.getdata(profile),
            loading: state.docsStatuses[idx]?.isLoading ?? false,
            enabled: !state.isUploading,
            documentPropertyPickerFn: _documentPropertyPickerFn(context, doc),
            uploadAction: (String image, String? target) {
              if (doc.update != null) {
                return G()
                    .rd<DocsCubit>()
                    .update(doc.update!(profile, image), 0);
              }

              final updater = doc.targets!
                  .firstWhereOrNull((taget) => taget.option == target)
                  ?.update;

              if (updater == null) return;

              G().rd<DocsCubit>().update(updater(profile, image), 0);
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

/// shows a menu to select the target document to upload (e.g. passport, nid)
Future<String?> Function()? _documentPropertyPickerFn(
  BuildContext context,
  DocInfo doc,
) {
  if (doc.targets == null) return null;

  final options = doc.targets!
      .map(
        (target) => TextButton(
          onPressed: () => Navigator.pop(context, target.option),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              target.option,
              style: TextStyle(
                color: CommonColors.primary,
              ),
            ),
          ),
        ),
      )
      .toList();

  return () => showDialog(
        context: context,
        builder: (ctx) => FractionallySizedBox(
          widthFactor: .85,
          heightFactor: .3,
          child: Material(
            child: Container(
              // height: 40,
              constraints: const BoxConstraints(maxHeight: 60),
              padding: const EdgeInsets.symmetric(
                vertical: CommonDimens.defaultGap,
                horizontal: CommonDimens.defaultGap,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CommonColors.background,
                borderRadius: BorderRadius.circular(
                  CommonDimens.defaultBorderRadiusMedium,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options,
                ),
              ),
            ),
          ),
        ),
      );
}

/// builds documentation file widget of color [hexColor] with shadow
Widget _buildDocumentIcon(String hexColor) {
  Widget getIconWithColor(String color) => SvgPicture.asset(
        AppAssets.documentationFileIcon,
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
                      HexColor.fromHex('22000000'),
                      BlendMode.srcATop,
                    ),
                    child: getIconWithColor(hexColor),
                  ),
                ),
              ),
            ),
          ),
        ),
        getIconWithColor(hexColor),
      ],
    ),
  );
}

Future<String> _createFileFromString(String data, String? fileName) async {
  var p = await Permission.storage.request();
  if (p.isDenied) p = await Permission.manageExternalStorage.request();
  if (p.isDenied) return '';

  final Uint8List bytes = base64.decode(data);

  // final path = (await getApplicationDocumentsDirectory()).path;
  var path = '/storage/emulated/0/Download/';
  if (Platform.isWindows) path = Directory.current.path;
  final String fileName0 =
      fileName ?? '${DateTime.now().millisecondsSinceEpoch}.jpg';

  final File file = File('$path/$fileName0');
  await file.writeAsBytes(bytes);

  NotificationService.showNotification(title: 'Download File', body: fileName0);

  return file.path;
}

Widget buidlDocumentWidget({
  BuildContext? context,
  int? positionedIdx,
  required DocInfo doc,
  String? data,
  String? fileName,
  bool loading = false,
  bool enabled = true,
  //
  Future<String?> Function()? documentPropertyPickerFn,
  required void Function(String, String?) uploadAction,
}) {
  final title = Container(
    width: double.infinity,
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.only(left: 30),
    margin: const EdgeInsets.all(0),
    child: Text(
      (doc.showTitle ?? true) ? doc.title : '',
      style: TextStyle(
        fontSize: 14,
        color: CommonColors.secondary,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  final desription = Container(
    width: double.infinity,
    alignment: Alignment.topLeft,
    // decoration: BoxDecoration(border: Border.all()),
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Text(
      doc.desc ?? '',
      style: TextStyle(
        fontSize: 10,
        color: CommonColors.secondaryTantLighter,
        fontWeight: FontWeight.w400,
      ),
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      textWidthBasis: TextWidthBasis.longestLine,
    ),
  );
  final uploadButton = Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor:
            enabled ? CommonColors.primary : CommonColors.secondary,
      ),
      onPressed: () async {
        if (!enabled) return;

        void uploadAnImage([String? target]) async {
          final imageStr = await pickAnImage(context);
          if (imageStr == null) return;

          uploadAction(imageStr, target);

          if (context?.mounted ?? false) {
            // ignore: use_build_context_synchronously
            G().showToast('Uploading ${doc.title}', context: context);
          }
        }

        if (documentPropertyPickerFn == null) return uploadAnImage();

        documentPropertyPickerFn().then((target) async {
          if (target == null) return;
          uploadAnImage(target);
        });
      },
      child: Text(S.current.upload),
    ),
  );
  final downloadButton = Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      onPressed: () async {
        _createFileFromString(data!, fileName);
      },
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.downloadIcon),
          const SizedBox(width: 7),
          Text(S.current.download),
        ],
      ),
    ),
  );

  final double sig = loading ? 2 : 0;
  Widget filter(Widget child) => ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: sig,
          sigmaY: sig,
        ),
        child: child,
      );

  final docStack = Stack(
    children: [
      //
      // Icon
      Container(child: _buildDocumentIcon(doc.color)),
      // Transform.scale(scale: 1.1, child: bg),
      //
      // Text
      filter(
        Column(
          children: [
            SizedBox(height: (doc.showTitle == false ? 50 : 55)),
            if (doc.showTitle != false) title,
            const SizedBox(height: 5),
            desription,
          ],
        ),
      ),
      //
      // Buttons
      Positioned(
        right: 16,
        bottom: 5,
        child: filter(
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (data != null) downloadButton,
                const SizedBox(width: 0),
                uploadButton,
              ],
            ),
          ),
        ),
      ),
      if (loading)
        const Center(
          child: CircularProgressIndicator(),
        ),
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
