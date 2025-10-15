import 'package:flutter/material.dart';
import 'package:worldcup/components/MainIconButton.dart';
import 'package:worldcup/components/PikuAppbar.dart';
import 'package:worldcup/components/StrokeText.dart';
import 'package:worldcup/main.dart';
import 'package:worldcup/my_color.dart';

class ResultPage extends StatefulWidget {
  final String winnerImage;
  final String winnerName;

  const ResultPage({
    super.key,
    required this.winnerImage,
    required this.winnerName,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        children: [
          PikuAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 750,
                      decoration: const BoxDecoration(color: Color(0xFF181818)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              widget.winnerImage,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: AlignmentGeometry.topCenter,
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0x70181818),
                              ),
                              child: Align(
                                alignment: AlignmentGeometry.center,
                                child: Text(
                                  "월드컵 우승",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset(0.5, 0.9),
                            child: OutlineText(
                              text: widget.winnerName,
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: MainIconButton(
                                buttonWidth: 180,
                                buttonHeight: 50,
                                buttonIcon: Icon(Icons.emoji_events),
                                text: "다른 월드컵보기",
                                textColor: Colors.white,
                                fontSize: 18,
                                textHoverColor: Colors.white,
                                buttonColor: MyColor.mainColor,
                                buttonHoverColor: MyColor.subColor,
                                buttonBorderRadius: 3,
                                buttonHoverBorderRadius: 3,
                                navigatePage: MainPage(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
