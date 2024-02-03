import 'package:flutter/material.dart';
import '/widgets/weather/constants.dart';

class WeatherPainter extends CustomPainter {
  WeatherPainter({required this.weatherLevel});

  final double weatherLevel;

  double _cloudOpacity() {
    const k =
        (1 - constMinCloudOpacity) / (constHighCloudLevel - constLowCloudLevel);

    if (weatherLevel < constLowCloudLevel) return 0;
    if (weatherLevel > constHighCloudLevel) return 1;
    return constMinCloudOpacity + k * (weatherLevel - constLowCloudLevel);
  }

  double _cloudOffset() {
    if (weatherLevel < constLowCloudLevel) return 1;
    if (weatherLevel > constHighCloudLevel) return 0;
    return 1 -
        (weatherLevel - constLowCloudLevel) /
            (constHighCloudLevel - constLowCloudLevel);
  }

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.width > 0 && size.height > 0);
    final centerPoint = Offset(size.width * 4 / 8, size.height * 3 / 8);
    const double refSunRadius = 31;

    // estimated scale
    final double k = ((size.width > size.height) ? size.height : size.width) /
        refSunRadius /
        4.5;
    final sunRadius = k * refSunRadius;
    final bubbleRadius = k * 21;
    final rainRadius =
        k * 3 * ((weatherLevel - constRainLevel1) / (1 - constRainLevel1) + 1);

    const sunColor = Colors.yellow;
    final cloudColor = Colors.grey.shade700;
    const rainColor = Colors.purple;
    final paintSun = Paint()..color = sunColor;
    final paintClouds = Paint()
      ..color = Color.fromRGBO(
          cloudColor.red, cloudColor.green, cloudColor.blue, _cloudOpacity());
    final paintRain = Paint()..color = rainColor;

    // cloud bubbles
    const List<Offset> bubblesSet = [
      Offset(-38, -1),
      Offset(-20, -18),
      Offset(7, -16),
      Offset(37, 3),
      Offset(7, 18),
      Offset(-21, 11),
    ];
    // rain
    const List<Offset> dripSet1 = [
      Offset(-46, -12),
      Offset(-23, 12),
      Offset(0, -12),
      Offset(23, 12),
      Offset(46, -12),
    ];
    const List<Offset> dripSet2 = [
      Offset(-57, 0),
      Offset(-34, 0),
      Offset(-11, 0),
      Offset(11, 0),
      Offset(34, 0),
      Offset(57, 0),
    ];
    const List<Offset> dripSet3 = [
      Offset(-46, 12),
      Offset(-23, -12),
      Offset(0, 12),
      Offset(23, -12),
      Offset(46, 12),
    ];

    // clip
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // DEBUG: paint borders
    // final paintBorders = Paint()..style = PaintingStyle.stroke;
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paintBorders);

    // sun
    if (weatherLevel <= constHighCloudLevel) {
      canvas.drawCircle(centerPoint, sunRadius, paintSun);
    }

    // cloud
    final cloudCenter =
        centerPoint + const Offset(40, -10) * k * _cloudOffset();
    // final cloudCenter =
    //     centerPoint + const Offset(60, 0) * k * _cloudOffset();

    final pathCloud = Path();
    for (final bubble in bubblesSet) {
      pathCloud.addOval(
        Rect.fromCircle(center: cloudCenter + bubble * k, radius: bubbleRadius),
      );
    }
    canvas.drawPath(pathCloud, paintClouds);

    // rain
    final rainCenter = centerPoint + const Offset(0, 55) * k;
    final pathRain = Path();

    if (weatherLevel > constRainLevel1) {
      for (final drip in dripSet1) {
        pathRain.addOval(
          Rect.fromCircle(center: rainCenter + drip * k, radius: rainRadius),
        );
      }
    }
    if (weatherLevel > constRainLevel2) {
      for (final drip in dripSet2) {
        pathRain.addOval(
          Rect.fromCircle(center: rainCenter + drip * k, radius: rainRadius),
        );
      }
    }
    if (weatherLevel > constRainLevel3) {
      for (final drip in dripSet3) {
        pathRain.addOval(
          Rect.fromCircle(center: rainCenter + drip * k, radius: rainRadius),
        );
      }
    }
    canvas.drawPath(pathRain, paintRain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return weatherLevel != (oldDelegate as WeatherPainter).weatherLevel;
  }
}
