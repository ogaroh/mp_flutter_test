import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/theme/theme.dart';
import 'package:moniepoint_test/counter/counter.dart';
import 'package:moniepoint_test/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
