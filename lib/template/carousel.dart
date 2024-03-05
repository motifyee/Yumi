import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/offer_card.dart';

class OfferCarousel extends StatefulWidget {
  OfferCarousel({super.key});

  int index = 0;
  List<dynamic> items = [
    {
      'id': 1,
      'color': ThemeSelector.colors.primary,
      'percent': 30,
      'image': "assets/images/humbarger.png"
    },
    {
      'id': 2,
      'color': ThemeSelector.colors.secondary,
      'percent': 15,
      'image': "assets/images/soup.png"
    },
  ];

  @override
  State<OfferCarousel> createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        if (widget.index == widget.items.length - 1) {
          widget.index = 0;
        } else {
          widget.index = widget.index + 1;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onHorizontalDragEnd: (dragEndDetails) {
              setState(() {
                if (dragEndDetails.primaryVelocity! > 0) {
                  if (widget.index == widget.items.length - 1) {
                    widget.index = 0;
                  } else {
                    widget.index = widget.index + 1;
                  }
                }
                if (dragEndDetails.primaryVelocity! < 0) {
                  if (widget.index == 0) {
                    widget.index = widget.items.length - 1;
                  } else {
                    widget.index = widget.index - 1;
                  }
                }
              });
            },
            child: OfferCard(
              offer: widget.items[widget.index],
            )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultGapXXL),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < widget.items.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultMicroGap),
                    child: Container(
                      width: ThemeSelector.statics.defaultLineGap,
                      height: ThemeSelector.statics.defaultLineGap,
                      decoration: BoxDecoration(
                        color: widget.index == i
                            ? ThemeSelector.colors.primary
                            : ThemeSelector.colors.secondaryFaint,
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultLineGap),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
