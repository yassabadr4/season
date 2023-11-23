import 'package:flutter/material.dart';
import 'package:season/main.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';

class YsMaterialApp extends StatelessWidget {
  const YsMaterialApp({
    super.key,
    this.title = '',
    this.theme,
    this.darkTheme,
    this.home,
    this.themeMode = ThemeMode.system,
  });
  final String title;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final Widget? home;
  final ThemeMode? themeMode;

  @override
  Widget build(BuildContext context) {
    final locale = YsLocalizationsProvider.get(context);
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: Locale(locale.languageCode),
      supportedLocales: YsLocalizations.supportedLocale,
      localizationsDelegates: YsLocalizations.localizationsDelegates,
      localeResolutionCallback: YsLocalizations.localeResolutionCallback,
      title: title,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: home,
    );
  }
}
