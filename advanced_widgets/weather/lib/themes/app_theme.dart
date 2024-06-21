import 'package:flutter/material.dart';

class ApplicationTheme extends InheritedWidget {
  final ThemeData theme;

  const ApplicationTheme({
    required this.theme,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ApplicationTheme oldWidget) {
    return theme != oldWidget.theme;
  }

  static ThemeData of(BuildContext context) {
    final obj = context.dependOnInheritedWidgetOfExactType<ApplicationTheme>();
    assert(obj != null, 'No ApplicationTheme found in this context.');
    return obj!.theme;
  }
}
