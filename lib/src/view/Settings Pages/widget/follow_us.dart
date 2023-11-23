import 'package:flutter/material.dart';
import 'package:season/src/app/utils/color.dart';


class FollowUs extends StatelessWidget {
  const FollowUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/instagram.png",
              height: 30,
              width: 40,
              color: defultblue,
            ),
            Image.asset(
              "assets/image/whatsapp.png",
              height: 30,
              width: 40,
              color: defultblue,
            ),
            Image.asset(
              "assets/image/tiktok.png",
              height: 30,
              width: 40,
              color: defultblue,
            ),
            Image.asset(
              "assets/image/youtube.png",
              height: 35,
              width: 40,
              color: defultblue,
            ),
            Image.asset(
              "assets/image/facebook.png",
              height: 35,
              width: 40,
              color: defultblue,
            ),
          ],
        );
  }
}
