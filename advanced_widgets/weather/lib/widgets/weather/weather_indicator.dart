import 'package:flutter/material.dart';

import '/business/business.dart';
import '/widgets/weather/constants.dart';
import '/widgets/weather/weather_static.dart';

//ignore: must_be_immutable
class WeatherIndicator extends StatefulWidget {
  final double weatherLevel;
  late WeatherWidgetMode _mode;
  final Size sizeSmall;
  final Size sizeBig;

  WeatherWidgetMode get mode => _mode;

  final void Function(WeatherWidgetMode newMode)? onModeChanged;

  WeatherIndicator({
    super.key,
    required this.weatherLevel,
    this.onModeChanged,
    WeatherWidgetMode mode = WeatherWidgetMode.small,
    this.sizeSmall = const Size(constCanvasSizeSmall, constCanvasSizeSmall),
    this.sizeBig = const Size(constCanvasSizeBig, constCanvasSizeBig),
  }) {
    _mode = mode;
  }

  @override
  State<WeatherIndicator> createState() => _WeatherIndicatorState();
}

class _WeatherIndicatorState extends State<WeatherIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool showText = true;
  double splitHeight = 0;
  Size currentSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onAnimationCompleted() {
    widget._mode = (widget._mode == WeatherWidgetMode.small)
        ? WeatherWidgetMode.big
        : WeatherWidgetMode.small;
    if (widget.onModeChanged != null) {
      widget.onModeChanged!(widget._mode);
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    showText = (widget._mode == WeatherWidgetMode.small) ? false : true;
    splitHeight =
        (widget.mode == WeatherWidgetMode.small) ? 1 : constSplitHeight;
    currentSize = (widget._mode == WeatherWidgetMode.small)
        ? widget.sizeSmall
        : widget.sizeBig;

    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          double widthMod;
          double heightMod;

          if (_controller.velocity != 0) {
            heightMod = widget.sizeSmall.height +
                _animation.value *
                    (widget.sizeBig.height - widget.sizeSmall.height);

            if (heightMod > widget.sizeBig.height * constSplitHeight) {
              splitHeight =
                  constSplitHeight * widget.sizeBig.height / heightMod;
            } else {
              splitHeight = 1;
            }

            showText = (splitHeight < constSplitHeight) ? true : false;

            widthMod = widget.sizeSmall.width +
                _animation.value *
                    (widget.sizeBig.width - widget.sizeSmall.width);

            currentSize = Size(widthMod, heightMod);
          }

          return GestureDetector(
            onTap: () {
              // showText = false;
              if (widget._mode == WeatherWidgetMode.small) {
                _controller.value = _controller.lowerBound;
                _controller.forward().whenComplete(() {
                  onAnimationCompleted();
                });
              } else {
                _controller.value = _controller.upperBound;
                _controller.reverse().whenComplete(() {
                  onAnimationCompleted();
                });
              }
            },
            child: WeatherStatic(
              weatherLevel: widget.weatherLevel,
              showText: showText,
              splitHeight: splitHeight,
              widgetSize: currentSize,
            ),
          );
        });
  }
}
