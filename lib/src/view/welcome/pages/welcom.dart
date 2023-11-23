import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/home/pages/bottomNavigation.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.white,
          ],
        )),
        child: Padding(
          padding: EdgeInsets.only(top: Appheight / 7, left: 10, right: 10),
          child: Column(
            children: [
              CustomText(
                text: "Welcom".trans,
                size: 22,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              Image.asset(
                "assets/image/Travel.png",
                height: 400,
              ),
              CustomText(
                text: "WelcomDoc".trans,
                size: 15,
                maxLines: 3,
                color: white,
              ),
              CustomText(
                text: "Faster_and_Easier".trans,
                size: 15,
                maxLines: 3,
                color: white,
              ),
              SizedBox(
                height: Appheight / 15,
              ),
              Button(
                  height: Appheight / 18,
                  width: Appwidth / 2,
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ControlView()),
                    );
                  },
                  text: "Get_Start".trans,
                  size: 20,
                  textColor: white,
                  buttonColor: darkblue)
            ],
          ),
        ),
      ),
    );
  }
}
