import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final double? strokeWidth;
  final Color? strokeColor;

  const OutlineText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize = 10,
    this.strokeWidth,
    this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 2
              ..color = strokeColor ?? Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
