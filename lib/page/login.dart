import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/PikuAppBar.dart';
import 'package:worldcup/main.dart';
import 'package:worldcup/my_color.dart';

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
            SizedBox(
              width: 300,
              height: 30,
              child: TextField(
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "이메일",
                  hintStyle: TextStyle(
                    color: MyColor.hintTextColor,
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: MyColor.borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: MyColor.mainColor, width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: 300,
                height: 30,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "비밀번호",
                    hintStyle: TextStyle(
                      color: MyColor.hintTextColor,
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: MyColor.borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: MyColor.borderColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: MyColor.mainColor,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: 300,
                height: 30,
                child: TextButton(
                  onPressed: () {
                    widget.controller.login();
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MainPage(controller: widget.controller),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.hovered)) {
                        return MyColor.subColor;
                      }
                      return MyColor.mainColor;
                    }),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  child: Text("로그인"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: 300,
                height: 30,
                child: TextButton(
                  onPressed: () {
                    widget.controller.login();
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MainPage(controller: widget.controller),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    side: WidgetStateProperty.resolveWith<BorderSide>((states) {
                      if (states.contains(WidgetState.hovered)) {
                        return BorderSide(color: Color(0xFFd2d2d2), width: 1);
                      }
                      return BorderSide(color: MyColor.borderColor, width: 1);
                    }),
                    foregroundColor: WidgetStateProperty.all(
                      MyColor.mainTextColor,
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  child: Text("계정 생성", style: TextStyle(fontSize: 13)),
                ),
              ),
            ),
            Text(
              "운영자 문의 : admin@jaum.kr",
              style: TextStyle(color: MyColor.mainTextColor, fontSize: 13),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith<Color>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.hovered)) {
                    return Color(0xFF23527c);
                  }
                  return Color(0xFF3389cb);
                }),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              child: Text("개인정보처리방침", style: TextStyle(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}
