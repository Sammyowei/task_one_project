import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends ConsumerWidget {
  final String text;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomText({
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.textColor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
