import 'package:flutter/material.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/MainExpansionTile.dart';
import 'package:worldcup/components/MainTextField.dart';
import 'package:worldcup/components/PikuAppbar.dart';
import 'package:worldcup/my_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        children: [
          PikuAppBar(),
          Padding(
            padding: EdgeInsets.only(top: 35, left: 30, right: 30),
            child: MainExpansionTile(
              text: "회원 정보",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              expandedWidget: Column(
                children: [
                  Line(
                    text: "이메일",
                    widget: MainTextField(
                      fontSize: 15,
                      enabledBorderColor: MyColor.borderColor,
                      enabledBorderWidth: 1,
                    ),
                  ),
                  Line(text: "닉네임", widget: MainTextField()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  final Widget? widget;
  final String? text;
  const Line({super.key, this.widget, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 1, color: MyColor.borderColor)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FractionallySizedBox(
              alignment: Alignment.centerRight,
              widthFactor: 0.55,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text ?? "",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: MyColor.mainTextColor,
                    ),
                  ),
                  widget ?? SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
