import 'package:flutter/material.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/view/widgets/text.dart';

class PassengersCounterWidget extends StatelessWidget {
  const PassengersCounterWidget(
      {super.key,
      required this.counter,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.minusPressed,
      required this.plusPressed});

  final int counter;
  final String title;
  final String subTitle;
  final IconData icon;
  final Function() minusPressed;
  final Function() plusPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: ListTile(
            leading: Icon(
              icon,
              size: 35,
            ),
            title: CustomText(
              text: title,
              color: black,
              size: 18,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: CustomText(
                text: subTitle,
                color: grey,
                size: 16,
              ),
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: minusPressed,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: defultblue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.remove,
                  color: white,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomText(
                text: '$counter',
                size: 20,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: plusPressed,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: defultblue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.add,
                  color: white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
