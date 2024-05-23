part of "application_flow_screen.dart";

class StepSettings {
  double value;
  double base;
  int stepCount;

  StepSettings(this.value, this.base, this.stepCount);
}

class CurvePainter extends CustomPainter {
  double rad = 15.0;

  var vsSettings = StepSettings(0.0, 0.0, 0);

  getStep(StepSettings settings) {
    settings.stepCount++;
    if (settings.stepCount == 1) return settings.value - rad;
    if (settings.stepCount < 6) return settings.value;
    settings.stepCount = 0;
    var tmp = settings.value;
    settings.value += settings.base;
    return tmp + rad;
  }

  setStep(StepSettings settings, value) {
    settings.value = value;
    settings.base = value;
    settings.stepCount = 0;
  }

  double get vs {
    return getStep(vsSettings);
  }

  set vs(double value) {
    setStep(vsSettings, value);
  }

  var hsSettings = StepSettings(0.0, 0.0, 0);
  double get hs {
    return getStep(hsSettings);
  }

  set hs(double value) {
    setStep(hsSettings, value);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.grey[400]!;
    paint.style = PaintingStyle.stroke; // Change this to fill
    paint.strokeWidth = 1.0;

    hs = size.width / 6;
    vs = size.height / 6;
    rad = 10.0;

    var path = Path();
    vsSettings.value += vsSettings.base / 4;
    path.lineTo(0, vs);
    path.quadraticBezierTo(0, vs, rad, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    hsSettings.value += hsSettings.base / 1.2;
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    // vsSettings.value += vsSettings.base / 3;
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    path.lineTo(hs, vs);
    path.quadraticBezierTo(hs, vs, hs, vs);
    vsSettings.value += vsSettings.base / 3;
    // vsSettings.value += vsSettings.base / 3;
    path.lineTo(hs, vs);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// path.lineTo(0, vs - rad);
// path.quadraticBezierTo(0, vs, rad, vs);
// path.lineTo(hs - rad, vs);
// path.quadraticBezierTo(hs, vs, hs, vs + rad);

// path.lineTo(hs, 2 * vs - rad);
// path.quadraticBezierTo(hs, 2 * vs, hs + rad, 2 * vs);
// path.lineTo(4 * hs - rad, 2 * vs);
// path.quadraticBezierTo(4 * hs, 2 * vs, 4 * hs, 2 * vs + rad);
// path.lineTo(4 * hs, 3 * vs - rad);
// path.quadraticBezierTo(4 * hs, 3 * vs, 4 * hs + rad, 3 * vs);
// path.lineTo(5 * hs - rad, 3 * vs);
// path.quadraticBezierTo(5 * hs, 3 * vs, 5 * hs, 3 * vs + rad);
// path.lineTo(5 * hs, 4 * vs - rad);
// path.quadraticBezierTo(5 * hs, 4 * vs, 5 * hs + rad, 4 * vs);
// path.lineTo(6 * hs - rad, 4 * vs);
// path.quadraticBezierTo(6 * hs, 4 * vs, 6 * hs, 4 * vs + rad);
// path.lineTo(6 * hs, 5 * vs - rad);