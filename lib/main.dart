import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';
import 'package:season/src/app/localization/ys_material_app.dart';
import 'package:season/src/app/provider/app_provider.dart';
import 'package:season/src/app/provider/auth_provider.dart';
import 'package:season/src/app/provider/cars_provider.dart';
import 'package:season/src/app/provider/flight_provider.dart';
import 'src/view/welcome/pages/welcom.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await YsLocalizations.init();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => YsLocalizationsProvider()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CarsProvider()),
        ChangeNotifierProvider(create: (_) => FlightProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return YsMaterialApp(
      title: 'app_name'.trans,
      home: WelcomePage(),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context =>
      NavigationService.navigatorKey.currentContext!;
}
