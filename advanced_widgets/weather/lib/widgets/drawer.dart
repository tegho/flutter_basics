import 'package:flutter/material.dart';
import '/business/business.dart';

class DrawerSettings extends StatelessWidget {
  const DrawerSettings({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    return Drawer(
      child: SingleChildScrollView(
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.settings,
                    size: 70,
                  ),
                ),
              ),
              const Divider(),
              const Center(child: Text('Choose a theme')),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<ThemePreset>(
                  selected: {bloc.state.themePreset},
                  onSelectionChanged: (Set<ThemePreset> newSelection) {
                    bloc.add(
                        ChangeThemePresetEvent(preset: newSelection.single));
                    scaffoldKey.currentState?.closeDrawer();
                  },
                  segments: const [
                    ButtonSegment<ThemePreset>(
                      value: ThemePreset.light,
                      label: Text('Light'),
                    ),
                    ButtonSegment<ThemePreset>(
                      value: ThemePreset.custom,
                      label: Text('Custom'),
                    ),
                    ButtonSegment<ThemePreset>(
                      value: ThemePreset.dark,
                      label: Text('Dark'),
                    ),
                  ],
                ),
              ),
              // const ColorPick(),
            ],
          );
        }),
      ),
    );
  }
}
