import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/MainButton.dart';
import 'package:worldcup/components/MainTextField.dart';
import 'package:worldcup/components/PikuAppBar.dart';
import 'package:worldcup/main.dart';
import 'package:worldcup/my_color.dart';
import 'package:worldcup/page/policy.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Center(
        child: Column(
          children: [
            PikuAppBar(controller: widget.controller),
            SizedBox(height: 60),
            Icon(Icons.emoji_events, size: 200, color: Color(0xFFe6e6e6)),
            Text(
              "Welcome to PIKU",
              style: TextStyle(
                color: MyColor.mainTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 17,
                letterSpacing: 1.8,
              ),
            ),
            Text(
              "이상형 월드컵을 만들고 공유하려면 로그인이 필요합니\n다.",
              style: TextStyle(color: MyColor.mainTextColor, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            Text(
              "이메일 주소만으로 간단히 계정 생성이 가능합니다.",
              style: TextStyle(color: MyColor.mainTextColor, fontSize: 13),
            ),
            SizedBox(height: 20),
            MainTextField(
              textFieldWidth: 300,
              textFieldHeight: 30,
              fontSize: 15,
              hintText: "이메일",
              hintFontSize: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MainTextField(
                password: true,
                textFieldWidth: 300,
                textFieldHeight: 30,
                fontSize: 15,
                hintText: "비밀번호",
                hintFontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MainButton(
                buttonWidth: 300,
                buttonHeight: 30,
                text: "로그인",
                fontSize: 13,
                textColor: Colors.white,
                textHoverColor: Colors.white,
                buttonColor: MyColor.mainColor,
                buttonHoverColor: MyColor.subColor,
                buttonBorderRadius: 3,
                buttonHoverBorderRadius: 3,
                onPressed: widget.controller.login,
                navigatePage: MainPage(controller: widget.controller),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MainButton(
                buttonWidth: 300,
                buttonHeight: 30,
                text: "계정 생성",
                fontSize: 13,
                textColor: MyColor.mainTextColor,
                textHoverColor: MyColor.mainTextColor,
                onPressed: widget.controller.login,
                navigatePage: MainPage(controller: widget.controller),
                buttonBorderWidth: 1,
                buttonBorderColor: MyColor.borderColor,
                buttonHoverBorderWidth: 1,
                buttonHoverBorderColor: Color(0xFFd2d2d2),
              ),
            ),
            Text(
              "운영자 문의 : admin@jaum.kr",
              style: TextStyle(color: MyColor.mainTextColor, fontSize: 13),
            ),
            MainButton(
              buttonWidth: 125,
              buttonHeight: 20,
              text: "개인정보처리방침",
              fontSize: 13,
              textColor: Color(0xFF3389cb),
              textHoverColor: Color(0xFF23527c),
              buttonColor: Colors.transparent,
              buttonHoverColor: Colors.transparent,
              navigatePage: PolicyPage(controller: widget.controller),
            ),
          ],
        ),
      ),
    );
  }
}
