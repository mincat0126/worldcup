import 'package:flutter/material.dart';
import 'package:worldcup/my_color.dart';

enum ButtonFontWeight { bold, normal }

class MainIconButton extends StatefulWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;
  final Color? buttonHoverColor;
  final Icon? buttonIcon;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? textHoverColor;
  final double? buttonBorderRadius;
  final Color? buttonBorderColor;
  final double? buttonBorderWidth;
  final Widget? navigatePage;
  final VoidCallback? onPressed;

  const MainIconButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.buttonHoverColor,
    this.buttonIcon,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textHoverColor,
    this.buttonBorderRadius,
    this.buttonBorderColor,
    this.buttonBorderWidth,
    this.navigatePage,
    this.onPressed,
  });

  @override
  State<MainIconButton> createState() => _MainIconButtonState();
}

class _MainIconButtonState extends State<MainIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonWidth ?? 50,
      height: widget.buttonHeight ?? 50,
      child: TextButton.icon(
        onPressed: () {
          widget.onPressed!();
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
        icon: widget.buttonIcon,
        label: Text(
          widget.text ?? "",
          style: TextStyle(
            fontSize: widget.fontSize ?? 0,
            fontWeight: widget.fontWeight,
          ),
        ),
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
      ),
    );
  }
}
