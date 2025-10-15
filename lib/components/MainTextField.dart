import 'package:flutter/material.dart';
import 'package:worldcup/my_color.dart';

class MainTextField extends StatefulWidget {
  final double? textFieldWidth;
  final double? textFieldHeight;
  final Color? textFieldColor;

  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? hintText;

  final double? hintFontSize;
  final Color? hintColor;

  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;

  final double? enabledBorderRadius;
  final Color? enabledBorderColor;
  final double? enabledBorderWidth;

  final double? focusedBorderRadius;
  final Color? focusedBorderColor;
  final double? focusedBorderWidth;

  final bool? password;
  final ValueChanged<String>? onSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const MainTextField({
    super.key,
    this.textFieldWidth,
    this.textFieldHeight,
    this.textFieldColor,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.hintText,
    this.hintFontSize,
    this.hintColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.enabledBorderRadius,
    this.enabledBorderColor,
    this.enabledBorderWidth,
    this.focusedBorderRadius,
    this.focusedBorderColor,
    this.focusedBorderWidth,
    this.password,
    this.onSubmitted,
    this.onChanged,
    this.controller,
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
        controller: widget.controller,
        style: TextStyle(
          fontSize: widget.fontSize ?? 10,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.textColor ?? Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.textFieldColor ?? Colors.white,
          hintText: widget.hintText ?? "",
          hintStyle: TextStyle(
            fontSize: widget.hintFontSize ?? 10,
            color: widget.hintColor ?? MyColor.hintTextColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth ?? 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.enabledBorderRadius ?? 0,
            ),
            borderSide: BorderSide(
              color: widget.enabledBorderColor ?? Colors.transparent,
              width: widget.enabledBorderWidth ?? 0,
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
        obscureText: widget.password ?? false,
        onSubmitted: (text) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(text);
          }
        },
        onChanged: widget.onChanged,
      ),
    );
  }
}
