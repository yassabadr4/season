import 'package:flutter/foundation.dart';
import 'package:season/src/app/data/dio/dio_client.dart';
import 'package:season/src/app/data/models/countries_model.dart';
import 'package:season/src/app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
export 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  final _api = DioClient.instance;
  AppProvider() {
    _loadCurrentTheme();
  }

  // Future<String?> getFCMToken() async {
  //   String? fcmToken;
  //   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  //   await firebaseMessaging.getToken().then((token) {
  //     fcmToken = token;
  //   });
  //   return fcmToken;
  // }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(AppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _darkTheme = sharedPreferences.getBool(AppConstants.THEME) ?? true;
    notifyListeners();
  }

  // Countries & Cities
  bool countriesLoad = false;
  List<CountriesModel>? countriesModel;
  Future<void> countries() async {
    countriesLoad = true;
    notifyListeners();

    await cities();
    countriesLoad = false;
    notifyListeners();
  }

  List<CitiesModel>? citiesList(String? countryId) {
    if (countryId == null) {
      return null;
    }
    if (citiesModel == null) {
      cities();
    }
    return citiesModel?.where((c) => c.countryId == countryId).toList();
  }

  bool citiesLoad = false;
  List<CitiesModel>? citiesModel;
  Future<void> cities() async {
    citiesModel = null;
    citiesLoad = true;
    notifyListeners();

    citiesLoad = false;
    notifyListeners();
  }
}
