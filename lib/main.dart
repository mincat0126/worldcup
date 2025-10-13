import 'package:flutter/material.dart';
import 'package:worldcup/page/worldcup.dart';
import 'package:worldcup/worldcup_data.dart';
import 'LoginController.dart';
import 'components/PikuAppbar.dart';
import 'my_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = LoginController();

    return MaterialApp(home: MainPage(controller: loginController));
  }
}

class MainPage extends StatelessWidget {
  final LoginController controller;
  const MainPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        children: [
          PikuAppBar(controller: controller),
          Padding(
            padding: const EdgeInsets.only(top: 39),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: 890,
                    height: 35,
                    child: TextField(
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "월드컵 제목 또는 인물 이름 으로 검색하세요.",
                        hintStyle: TextStyle(
                          color: MyColor.hintTextColor,
                          fontSize: 13,
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
                SizedBox(
                  width: 50,
                  height: 35,
                  child: TextButton.icon(
                    onPressed: () {},

                    label: Text(
                      "검색",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return MyColor.subColor;
                        }
                        return MyColor.mainColor;
                      }),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: worldCups.length,
              itemBuilder: (context, index) {
                final cup = worldCups[index];
                return Container(
                  width: 10,
                  height: 300,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              cup.images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              cup.images[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(color: Color(0xFFf8f8f9)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                child: Text(
                                  cup.imageNames[0],
                                  style: TextStyle(
                                    color: MyColor.mainTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                child: Text(
                                  cup.imageNames[1],
                                  style: TextStyle(
                                    color: MyColor.mainTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              cup.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MyColor.mainTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              cup.description,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: MyColor.mainTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsGeometry.only(bottom: 5, left: 5),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 105,
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => WorldcupPage(
                                            controller: controller,
                                            worldCup: cup,
                                          ),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                icon: Icon(Icons.play_arrow),
                                label: Text(
                                  "시작하기",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith<Color>((
                                        Set<WidgetState> states,
                                      ) {
                                        if (states.contains(
                                          WidgetState.hovered,
                                        )) {
                                          return Colors.white;
                                        }
                                        return Color(0xFFed5565);
                                      }),
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith<Color>((
                                        Set<WidgetState> states,
                                      ) {
                                        if (states.contains(
                                          WidgetState.hovered,
                                        )) {
                                          return Color(0xFFed5565);
                                        }
                                        return Colors.white;
                                      }),
                                  overlayColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                  side: WidgetStateProperty.all(
                                    BorderSide(color: Color(0xFFed5565)),
                                  ),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
