import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/MainButton.dart';
import 'package:worldcup/components/MainIconButton.dart';
import 'package:worldcup/main.dart';
import 'package:worldcup/my_color.dart';
import 'package:worldcup/page/createWorldcup.dart';
import 'package:worldcup/page/login.dart';
import 'package:worldcup/page/profile.dart';

class PikuAppBar extends StatefulWidget {
  const PikuAppBar({super.key});

  @override
  State<PikuAppBar> createState() => _PikuAppBarState();
}

class _PikuAppBarState extends State<PikuAppBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);

    return Column(
      children: [
        Row(
          children: [
            MainIconButton(
              buttonWidth: 110,
              buttonHeight: 50,
              navigatePage: MainPage(),
              buttonIcon: Icon(
                Icons.emoji_events,
                size: 20,
                color: Colors.white,
              ),
              text: "PIKU",
              fontSize: 18,
              fontWeight: FontWeight.normal,
              textColor: Colors.white,
              textHoverColor: Colors.white,
              buttonColor: MyColor.mainColor,
              buttonHoverColor: MyColor.mainColor,
            ),
            MainButton(
              buttonWidth: 120,
              buttonHeight: 50,
              navigatePage: MainPage(),
              text: "이상형 월드컵",
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            controller.isLogin
                ? MainButton(
                    buttonWidth: 160,
                    buttonHeight: 50,
                    navigatePage: CreateWorlcupPage(),
                    text: "이상형 월드컵 만들기",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )
                : SizedBox(),
            controller.isLogin
                ? MainButton(
                    buttonWidth: 120,
                    buttonHeight: 50,
                    navigatePage: MainPage(),
                    text: "내가 만든 월드컵",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )
                : SizedBox(),

            controller.isLogin
                ? MainButton(
                    buttonWidth: 90,
                    buttonHeight: 50,
                    navigatePage: MainPage(),
                    text: "이어하기",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )
                : SizedBox(),

            Flexible(
              flex: 1,
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            controller.isLogin
                ? MainIconButton(
                    buttonWidth: 160,
                    buttonHeight: 50,
                    buttonIcon: Icon(Icons.account_circle, size: 20),
                    text: "회원정보 수정",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    navigatePage: ProfilePage(),
                  )
                : SizedBox(),
            controller.isLogin
                ? MainIconButton(
                    buttonWidth: 120,
                    buttonHeight: 50,
                    buttonIcon: Icon(Icons.logout),
                    onPressed: controller.logout,
                    navigatePage: MainPage(),
                    text: "Log out",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )
                : MainIconButton(
                    buttonWidth: 140,
                    buttonHeight: 50,
                    buttonIcon: Icon(Icons.login),
                    navigatePage: LoginPage(),
                    text: "Login",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
          ],
        ),
      ],
    );
  }
}
