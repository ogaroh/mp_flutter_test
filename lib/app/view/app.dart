import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/theme/theme.dart';
import 'package:moniepoint_test/home/views/pages/default_scaffold_page.dart';
import 'package:moniepoint_test/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    final textTheme = createTextTheme(context, 'Poppins', 'Poppins');
    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DefaultScaffoldPage(),
    );
  }
}
