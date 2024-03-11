import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumi/extensions/color.dart';
import 'package:yumi/features/chef_application/documentation/bloc/ui/icon_bloc.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class DocumentationScreen extends StatelessWidget {
  DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SVGBloc>().add(SVGEvent());
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
        ),
        body: BlocBuilder<SVGBloc, SVGState>(builder: (context, state) {
          return SingleChildScrollView(
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
                documentWidgets(),
              ],
            ),
          );
        }),
      ),
    );
  }

  var data = [
    {"title": 'Hygiene Certificate', "desc": 'You must obtain level two'},
    {"title": 'Local Authority Registration', "desc": ''},
    {"title": 'Risk Assessment', "desc": ''},
    {
      "title": 'ID/Passport copy',
      "desc":
          'The passport must be of British or Irish nationality and valid for at least 6 months'
    },
  ];

  Widget documentWidgets() {
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
              docLink: "",
              desc: data[0]['desc']),
          documentWidget(
              hexBg: "#EDEDED",
              positionedIdx: 1,
              title: data[1]['title'],
              desc: data[01]['desc']),
          documentWidget(
            hexBg: "#E0E0E0",
            positionedIdx: 2,
            title: data[02]['title'],
            desc: data[02]['desc'],
            docLink: "",
          ),
          documentWidget(
            hexBg: "#687C8E",
            positionedIdx: 03,
            title: data[03]['title'],
            desc: data[03]['desc'],
            docLink: "",
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
  String? docLink,
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
      onPressed: () async {
        ImagePicker imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.gallery);
        print(image);
      },
      child: const Text("Upload"),
    ),
  );
  var downloadButton = Container(
    alignment: Alignment.bottomRight,
    child: TextButton(
      onPressed: () async {},
      child: Row(children: [
        SvgPicture.asset("assets/images/download_icon.svg"),
        const SizedBox(width: 7),
        const Text("Download"),
      ]),
    ),
  );

  var stack = Stack(
    // fit: StackFit.expand,
    children: [
      // Icon
      Container(child: fileSvg(hexBg ?? "FFFFFF")),
      // Transform.scale(scale: 1.1, child: bg),
      // Text
      Column(
        children: [
          const SizedBox(height: 60),
          titleWdg,
          const SizedBox(height: 5),
          desription,
        ],
      ),
      // Button
      Positioned(
        right: 22,
        bottom: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (docLink != null) downloadButton,
            const SizedBox(width: 0),
            uploadButton,
          ],
        ),
      ),
      // Positioned(
      //   right: 22,
      //   bottom: 15,
      //   child: Container(child: uploadButton),
      // )
    ],
  );

  if (positionedIdx == null) {
    return SizedBox(
      height: 155,
      width: 340,
      child: stack,
    );
  }

  return Positioned(
    top: (105 * positionedIdx).toDouble(),
    height: 155,
    width: 340,
    child: stack,
  );
}
