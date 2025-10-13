import 'package:flutter/material.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/my_color.dart';

enum ButtonFontWeight { bold, normal }

class MainButton extends StatefulWidget {
  final LoginController controller;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;
  final Color? buttonHoverColor;
  final String? text;
  final double? fontSize;
  final ButtonFontWeight? fontWeight;
  final Color? textColor;
  final Color? textHoverColor;
  final double? buttonBorderRadius;
  final Color? buttonBorderColor;
  final double? buttonBorderWidth;
  final Widget? navigatePage;

  const MainButton({
    super.key,
    required this.controller,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.buttonHoverColor,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textHoverColor,
    this.buttonBorderRadius,
    this.buttonBorderColor,
    this.buttonBorderWidth,
    this.navigatePage,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    FontWeight chosenFontWeight;
    switch (widget.fontWeight) {
      case ButtonFontWeight.normal:
        chosenFontWeight = FontWeight.normal;
        break;
      case ButtonFontWeight.bold:
      default:
        chosenFontWeight = FontWeight.bold;
        break;
    }

    return SizedBox(
      width: widget.buttonWidth ?? 50,
      height: widget.buttonHeight ?? 50,
      child: TextButton(
        onPressed: () {
          if (widget.navigatePage != null) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    widget.navigatePage!,
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }
        },
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered)) {
              return widget.textHoverColor ?? MyColor.mainColor;
            }
            return widget.textColor ?? MyColor.mainTextColor;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered)) {
              return widget.buttonHoverColor ?? Colors.white;
            }
            return widget.buttonColor ?? Colors.white;
          }),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: widget.buttonBorderColor ?? Colors.white,
                width: widget.buttonBorderWidth ?? 0,
              ),
              borderRadius: BorderRadius.circular(
                widget.buttonBorderRadius ?? 0,
              ),
            ),
          ),
        ),
        child: Text(
          widget.text ?? "",
          style: TextStyle(
            fontSize: widget.fontSize ?? 0,
            fontWeight: chosenFontWeight,
          ),
        ),
      ),
    );
  }
}
