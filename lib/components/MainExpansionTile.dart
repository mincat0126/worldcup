import 'package:flutter/material.dart';
import 'package:worldcup/my_color.dart';

class MainExpansionTile extends StatefulWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? textPadding;

  final double? iconPadding;
  final IconData? expandedIcon;
  final IconData? noExpandedIcon;
  final Color? iconColor;
  final double? iconSize;

  final Widget? expandedWidget;

  const MainExpansionTile({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textPadding,
    this.iconPadding,
    this.expandedIcon,
    this.noExpandedIcon,
    this.iconColor,
    this.iconSize,
    this.expandedWidget,
  });

  @override
  State<MainExpansionTile> createState() => _MainExpansionTileState();
}

class _MainExpansionTileState extends State<MainExpansionTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(widget.textPadding ?? 15),
                child: Text(
                  widget.text ?? "",
                  style: TextStyle(
                    color: widget.textColor ?? MyColor.mainTextColor,
                    fontSize: widget.fontSize ?? 13,
                    fontWeight: widget.fontWeight ?? FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsGeometry.only(
                  right: widget.iconPadding ?? 10,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  child: Icon(
                    expanded
                        ? widget.expandedIcon ?? Icons.keyboard_arrow_up
                        : widget.noExpandedIcon ?? Icons.keyboard_arrow_down,
                    color: widget.iconColor ?? Color(0xFFc4c4c4),
                    size: widget.iconSize ?? 25,
                  ),
                ),
              ),
            ],
          ),
          if (expanded) widget.expandedWidget ?? SizedBox(),
        ],
      ),
    );
  }
}
