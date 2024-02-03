import 'package:flutter/material.dart';

import '/widgets/weather/constants.dart';
import '/widgets/weather/weather_painter.dart';

class WeatherStatic extends StatelessWidget {
  const WeatherStatic({
    super.key,
    required this.weatherLevel,
    required this.widgetSize,
    required this.showText,
    required this.splitHeight,
  });

  final double weatherLevel;
  final Size widgetSize;
  final bool showText;
  final double splitHeight;

  List<String> _weatherToString() {
    List<String> ret = [];
    if (weatherLevel >= constRainLevel3) {
      ret.add('Проливные дожди');
      ret.add('Холодно');
    } else if (weatherLevel >= constRainLevel2) {
      ret.add('Сильный дождь');
      ret.add('Прохладно');
    } else if (weatherLevel >= constRainLevel1) {
      ret.add('Дождь');
      ret.add('Прохладно');
    } else if (weatherLevel >= constHighCloudLevel) {
      ret.add('Пасмурно');
      ret.add('Тепло');
    } else if (weatherLevel >= (constHighCloudLevel + constLowCloudLevel) / 2) {
      ret.add('Облачно');
      ret.add('Тепло');
    } else if (weatherLevel >= constLowCloudLevel) {
      ret.add('Слабая облачность');
      ret.add('Тепло');
    } else {
      ret.add('Ясно');
      ret.add('Жара');
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    // estimated font scale
    final double fontScale = widgetSize.height / 256;
    return ConstrainedBox(
      constraints: BoxConstraints.tight(widgetSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomPaint(
            size: Size(widgetSize.width, widgetSize.height * splitHeight),
            painter: WeatherPainter(weatherLevel: weatherLevel),
          ),
          (!showText)
              ? Container()
              : Expanded(
                  child: ClipRect(
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: _weatherToString()
                              .map((str) => Text(
                                    str,
                                    style: TextStyle(fontSize: 20 * fontScale),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
