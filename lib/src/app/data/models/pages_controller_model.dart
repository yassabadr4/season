import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/src/view/auth/pages/sign_in.dart';
import '../../../view/home/pages/codePage.dart';
import '../../../view/home/pages/homePage.dart';
import '../../../view/Settings Pages/setting.dart';

class ControlViewModel extends GetxController {
  int navigatorValue = 0;

  Widget currentScreen = const HomePage();

  void changeSelectedValue(int selectedValue) {
    navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = const HomePage();
          break;
        }
      case 1:
        {
          currentScreen = const SigInPage();
          break;
        }
      case 2:
        {
          currentScreen = const CodePage();
          break;
        }
      case 3:
        {
          currentScreen = const SettingPage();
          break;
        }
    }
    update();
  }
}
