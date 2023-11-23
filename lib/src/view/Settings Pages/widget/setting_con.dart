import 'package:flutter/material.dart';
import 'package:season/src/view/widgets/text.dart';

class SettingCount extends StatelessWidget {
  const SettingCount(
      {super.key,
      required this.purfixIcon,
      required this.text,
      required this.suffixIcon,
      this.onpress});
  final Icon purfixIcon;
  final String text;
  final Icon suffixIcon;
  final VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                purfixIcon,
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: text,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            suffixIcon
          ],
        ),
      ),
    );
  }
}
