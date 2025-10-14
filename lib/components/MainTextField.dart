import 'package:flutter/material.dart';
import 'package:worldcup/my_color.dart';

class MainTextField extends StatefulWidget {
  final double? textFieldWidth;
  final double? textFieldHeight;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textFieldColor;
  final String? hintText;
  final double? hintFontSize;
  final Color? hintColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? enabledBorderRadius;
  final Color? enabledBorderColor;
  final double? focusedBorderRadius;
  final double? focusedBorderWidth;
  final Color? focusedBorderColor;

  const MainTextField({
    super.key,
    this.textFieldWidth,
    this.textFieldHeight,
    this.fontSize,
    this.fontWeight,
    this.textFieldColor,
    this.hintText,
    this.hintFontSize,
    this.hintColor,
    this.borderRadius,
    this.borderColor,
    this.enabledBorderRadius,
    this.enabledBorderColor,
    this.focusedBorderWidth,
    this.focusedBorderRadius,
    this.focusedBorderColor,
  });

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.textFieldWidth ?? 150,
      height: widget.textFieldHeight ?? 150,
      child: TextField(
        style: TextStyle(
          fontSize: widget.fontSize ?? 10,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.textFieldColor ?? Colors.white,
          hintText: widget.hintText ?? "",
          hintStyle: TextStyle(
            fontSize: widget.hintFontSize,
            color: widget.hintColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(color: widget.borderColor ?? Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.enabledBorderRadius ?? 0,
            ),
            borderSide: BorderSide(
              color: widget.enabledBorderColor ?? Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.focusedBorderRadius ?? 0,
            ),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ?? MyColor.mainColor,
              width: widget.focusedBorderWidth ?? 1,
            ),
          ),

          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          hoverColor: Colors.transparent,
        ),
      ),
    );
  }
}
