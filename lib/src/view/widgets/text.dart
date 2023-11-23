import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.size,
      this.weight,
      this.color,
      this.alignment,
       this.maxLines});
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final Alignment? alignment;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
        ),
      ),
    );
  }
}
