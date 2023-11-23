import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/src/app/data/models/pages_controller_model.dart';
import 'package:season/src/app/utils/color.dart';

// ignore: must_be_immutable
class ControlView extends StatelessWidget {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  ControlView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: Get.put(ControlViewModel()),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: controller.navigatorValue,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.home, size: 30, color: white),
            Icon(Icons.key, size: 30, color: white),
            Icon(Icons.polyline_outlined, size: 30, color: white),
            Icon(Icons.settings, size: 30, color: white),
          ],
          color: defultblue,
          buttonBackgroundColor: defultblue,
          backgroundColor: Colors.blueAccent.withOpacity(0),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          letIndexChange: (index) => true,
        ),
        //  bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        backgroundColor: darkblue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.key,
              color: black,
            ),
            label: "login",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.code,
                color: black,
              ),
              label: "Notification"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: black,
            ),
            label: "Setting",
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: const Color.fromRGBO(0, 48, 96, 1),
      ),
    );
  }
}
