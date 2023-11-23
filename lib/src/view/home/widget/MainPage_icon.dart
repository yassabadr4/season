import 'package:flutter/material.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/view/widgets/text.dart';

class IconsForMainPage extends StatelessWidget {
  const IconsForMainPage(
      {super.key,
      required this.icon,
      this.onpress,
      this.backgroundColor,
      required this.text});
  final Icon icon;
  final VoidCallback? onpress;
  final Color? backgroundColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 25,
            child: icon,
          ),
          SizedBox(height: 8),
          CustomText(
            text: text,
            size: 16,
            color: white,
          ),
        ],
      ),
    );
  }
}
