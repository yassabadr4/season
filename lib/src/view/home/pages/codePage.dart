import 'package:flutter/material.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/text.dart';


class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Appheight / 10,
            width: double.infinity,
            color: defultblue,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
              ),
              child: CustomText(
                text: "inquire".trans,
                size: 18,
                color: white,
                alignment: Alignment.center,
              ),
            ),
          ),
          const Divider(
            color: yellow,
            height: 4,
            thickness: 3,
          ),
          Padding(
            padding: EdgeInsets.only(top: 45, right: 15, left: 15),
            child: CustomText(
              text: "inquire_reservation".trans,
              size: 18,
              color: black,
              alignment: Alignment.center,
            ),
          ),
          CustomText(
            text: "confirm_code".trans,
            size: 18,
            color: black,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, bottom: 60, right: 20, left: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "code".trans,
                  hintStyle: TextStyle(fontSize: 14, color: grey)),
            ),
          ),
          Button(
              height: Appheight / 18,
              width: Appwidth / 1.3,
              onpress: () {},
              borderRadius: 20,
              text: "confirm".trans,
              size: 20,
              textColor: white,
              buttonColor: defultblue),
        ],
      ),
    );
  }
}
