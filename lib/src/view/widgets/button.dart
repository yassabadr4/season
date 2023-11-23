import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.textColor,
    this.alignment,
    this.buttonColor,
    this.width,
    this.height,
    this.onpress,
    this.borderRadius =7,
  });
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? textColor;
  final Color? buttonColor;
  final Alignment? alignment;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: size,
              fontWeight: weight,
            ),
          ),
        ),
      ),
    );
  }
}
