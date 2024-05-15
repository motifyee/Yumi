import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class SVGEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SVGState extends Equatable {
  final String? svgString;

  svgFrom(double idx) {
    if (svgString == null || (svgString?.isEmpty ?? false)) return Container();

    var colored = "";
    switch (idx) {
      case -1:
        colored = svgString!.replaceAll("red", "#000000");
        break;
      case 0:
        colored = svgString!.replaceAll("red", "#F9F9F9");
        break;
      case 1:
        colored = svgString!.replaceAll("red", "#F1F1F1");
        break;
      case 2:
        colored = svgString!.replaceAll("red", "#E0DFDF");
        break;
      case 3:
        colored = svgString!.replaceAll("red", "#8B97A7");
        break;
      default:
    }

    return IgnorePointer(child: SvgPicture.string(colored));
    // return SizedBox(
    //   height: 200,
    //   width: 200,
    //   child: Stack(
    //     children: [
    //       Opacity(
    //         opacity: 0.2,
    //         child: svgSahdow,
    //       ),
    //       ClipRect(
    //         child: BackdropFilter(
    //           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    //           child: SvgPicture.string(colored),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }

  get svgSahdow => svgFrom(-1);
  get svg1 => svgFrom(0);
  get svg2 => svgFrom(1);
  get svg3 => svgFrom(2);
  get svg4 => svgFrom(3);

  const SVGState({this.svgString});

  // SVGState copyWith({Icon? svg}) {
  //   return SVGState(svgString: svg ?? this.svgString ?? "");
  // }

  @override
  List<Object?> get props => [svg];
}

class SVGBloc extends Bloc<SVGEvent, SVGState> {
  final _completer = StreamController<void>.broadcast();
  Stream<void> get completer => _completer.stream;

  SVGBloc() : super(const SVGState()) {
    // _loadSVG();

    on<SVGEvent>((event, emit) async {
      final String icon = await _loadSVG();

      emit(SVGState(svgString: icon));
    });
  }

  _loadSVG() async {
    final String icon =
        await rootBundle.loadString("assets/images/docs_file.svg");

    // emit(SVGState(svg: SvgPicture.string(icon, width: 100, height: 100)));

    // _completer.sink.add(null);
    return icon;
  }
}
