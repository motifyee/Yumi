import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/template/screen_container.dart';

part "curve.dart";

@RoutePage()
class ChefApplicationFlowScreen extends StatelessWidget {
  const ChefApplicationFlowScreen({super.key});
// double deviceWidth = MediaQuery.of(context).size.width;
// double deviceHeight = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.topLeft,
                      child: const Image(
                        image: AssetImage('assets/images/vegies.png'),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 75),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                // padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: stepStack(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

Widget stepStack() {
  List iconNames = [
    "profile",
    "approval",
    "contract",
    "documentation",
    "menu",
  ];
  var headers = [
    ["Profile", "First, you should complete your profile"],
    ["Your Menu", "Secondly, add your meals on menu and schedule it"],
    ["Documentation", "Third, attach your documents"],
    ["Get Approval", "Then, waiting for approval within 72 hours"],
    ["Get Contract", "Finally, download the contract to sign and upload it"],
  ];

  Function(int, num, num, List<String>, {bool alignRight}) stepperFn(
      BoxConstraints constraints) {
    var hs = constraints.maxWidth / 4.9;
    var vs = constraints.maxHeight / 5;
    var iconBuilders = iconNames
        .map((e) => (String header, String subHeader, bool alignRight) {
              var items = [
                SizedBox(
                  // height: vs,

                  child: SvgPicture.asset(
                    "assets/images/flow/$e.svg",
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    crossAxisAlignment: alignRight
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        header,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          subHeader,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ];

              return Container(
                  padding: EdgeInsets.only(
                      left: 4.0,
                      right: 4.0,
                      top: alignRight ? 8 : 0,
                      bottom: alignRight ? 0 : 12),
                  alignment:
                      alignRight ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: alignRight
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: alignRight ? items.reversed.toList() : items));
            })
        .toList();

    return (int i, num x, num y, List<String> header,
        {bool alignRight = false}) {
      var items = iconBuilders[i](header[0], header[1], alignRight);
      var foregroundDecoration = const BoxDecoration(
        color: Colors.grey,
        backgroundBlendMode: BlendMode.saturation,
      );

      return Positioned(
        left: !alignRight ? hs * x : 0,
        // left: alignRight ? hs * x - 150 : hs * x,
        width: alignRight ? hs * x : null,
        right: alignRight ? null : 0,
        top: vs * y,
        child: Container(
          // ColorFiltered
          // colorFilter: const ColorFilter.mode(
          //   Colors.white,
          //   BlendMode.saturation,
          // ),
          // decoration: BoxDecoration(border: Border.all()),
          foregroundDecoration: foregroundDecoration,
          child: items,
        ),
      );
    };
  }

  return LayoutBuilder(
    builder: (context, constraints) {
      var step = stepperFn(constraints);

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(child: curve()),
          ),
          step(0, 0, 0.25, headers[0]),
          step(1, 1, 1.25, headers[1]),
          step(2, 2.83, 2.25, headers[2], alignRight: true),
          step(3, 3.83, 3.25, headers[3], alignRight: true),
          step(4, 4.83, 4.25, headers[4], alignRight: true),
        ],
      );
    },
  );
}

Widget curve() {
  return Container(
    child: CustomPaint(
      painter: CurvePainter(),
    ),
  );
}
