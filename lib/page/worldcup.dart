import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/PikuAppBar.dart';
import 'package:worldcup/components/StrokeText.dart';
import 'package:worldcup/my_color.dart';
import 'package:worldcup/page/result.dart';
import 'package:worldcup/worldcup_data.dart';

class WorldcupPage extends StatefulWidget {
  final LoginController controller;
  final WorldCup worldCup;

  const WorldcupPage({
    super.key,
    required this.controller,
    required this.worldCup,
  });

  @override
  State<WorldcupPage> createState() => _WorldcupPageState();
}

class _WorldcupPageState extends State<WorldcupPage> {
  late List<int> currentRoundIndexes; // 이번 라운드 남은 이미지
  late List<int> nextRoundIndexes; // 다음 라운드 나갈 이미지
  late List<int> currentImages; // 현재 표시 중인 2개 이미지
  final Random rand = Random();

  Alignment leftAlignment = Alignment.centerLeft;
  Alignment rightAlignment = Alignment.centerRight;
  double leftOpacity = 1.0;
  double rightOpacity = 1.0;
  double leftScale = 1.0;
  double rightScale = 1.0;
  bool animating = false;

  //첫 라운드에서 나올 이미지들 만들기
  @override
  void initState() {
    super.initState();
    currentRoundIndexes = List.generate(
      widget.worldCup.images.length,
      (i) => i, //람다로 사진들 초기화
    );
    nextRoundIndexes = [];
    generateNextImages();
  }

  //다음 라운드 이미지 세팅
  void generateNextImages() {
    if (currentRoundIndexes.isEmpty) {
      //결과창으로 이동
      if (nextRoundIndexes.length == 1) {
        final winnerIndex = nextRoundIndexes[0];
        final winnerImage = widget.worldCup.images[winnerIndex];
        final winnerName = widget.worldCup.imageNames[winnerIndex];

        Future.microtask(() {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ResultPage(
                    controller: widget.controller,
                    winnerImage: winnerImage,
                    winnerName: winnerName,
                  ),

              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        });
        return;
      }

      // 다음 라운드 세팅
      if (nextRoundIndexes.length > 1) {
        currentRoundIndexes = List.from(nextRoundIndexes);
        nextRoundIndexes.clear();
      } else {
        return;
      }
    }

    // 이번 라운드에서 랜덤 2개 뽑기
    if (currentRoundIndexes.length >= 2) {
      int first = currentRoundIndexes[rand.nextInt(currentRoundIndexes.length)];
      int second;
      do {
        second = currentRoundIndexes[rand.nextInt(currentRoundIndexes.length)];
      } while (second == first);
      currentImages = [first, second];
    } else if (currentRoundIndexes.length == 1) {
      currentImages = [currentRoundIndexes[0]];
    }

    leftAlignment = Alignment.centerLeft;
    rightAlignment = Alignment.centerRight;
    leftOpacity = 1.0;
    rightOpacity = 1.0;
    leftScale = 1.0;
    rightScale = 1.0;
  }

  //이미지 선택
  void onSelectImage(int selectedIndex) {
    if (animating) return;

    setState(() {
      animating = true;

      if (selectedIndex == 0) {
        // 왼쪽
        leftAlignment = Alignment.center;
        leftScale = 1.2;
        rightAlignment = const Alignment(1.5, 0);
        rightOpacity = 0.0;
        rightScale = 0.8;
      } else {
        // 오른쪽
        rightAlignment = Alignment.center;
        rightScale = 1.2;
        leftAlignment = const Alignment(-1.5, 0);
        leftOpacity = 0.0;
        leftScale = 0.8;
      }
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        animating = false;
        nextRoundIndexes.add(currentImages[selectedIndex]);

        for (int image in currentImages) {
          currentRoundIndexes.remove(image);
        }

        generateNextImages();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cup = widget.worldCup;

    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        children: [
          PikuAppBar(controller: widget.controller),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFF181818)),
                child: Stack(
                  children: [
                    // 왼쪽 이미지
                    CurrentImage(
                      cup,
                      Alignment.centerLeft,
                      0,
                      leftAlignment,
                      leftScale,
                      leftOpacity,
                    ),
                    // 오른쪽 이미지
                    CurrentImage(
                      cup,
                      Alignment.centerRight,
                      1,
                      rightAlignment,
                      rightScale,
                      rightOpacity,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      color: Color(0x70181818),
                      child: Center(
                        child: Text(
                          widget.worldCup.title,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Align CurrentImage(
    WorldCup cup,
    Alignment position,
    int imageIndexNum,
    Alignment alignDir,
    double scaleDir,
    double opacityDir,
  ) {
    return Align(
      alignment: position,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 1,
        child: GestureDetector(
          onTap: () => onSelectImage(imageIndexNum),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: alignDir,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: AnimatedScale(
                  scale: scaleDir,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: opacityDir,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      cup.images[currentImages[imageIndexNum]],
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.5, 0.71),
                child: OutlineText(
                  text: cup.imageNames[currentImages[imageIndexNum]],
                  fontSize: 40,
                  strokeWidth: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
