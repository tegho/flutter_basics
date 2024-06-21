import 'package:flutter/material.dart';

import '/business/business.dart';
import '/themes/app_theme.dart';
import '/widgets/main_page.dart';

void main() {
  final BusinessProvider businessProvider = BusinessProvider();

  runApp(MyApp(businessProvider: businessProvider));
}

class MyApp extends StatelessWidget {
  final BusinessProvider businessProvider;

  const MyApp({super.key, required this.businessProvider});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: businessProvider.appBloc,
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        // print('STATE has been changed!');
        return ApplicationTheme(
          theme: state.theme,
          child: const ThemeMaterial(),
        );
      }),
    );
  }
}

class ThemeMaterial extends StatelessWidget {
  const ThemeMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    // print('THEME has been changed');
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.of(context),
      home: const MyHomePage(title: 'Weather'),
    );
  }
}
