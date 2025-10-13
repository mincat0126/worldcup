import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/PikuAppBar.dart';
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
  late List<int> nextRoundIndexes; // 다음 라운드 진출 이미지
  late List<int> currentImages; // 현재 표시 중인 2개 이미지
  final Random rand = Random();

  // 애니메이션 상태
  Alignment leftAlignment = Alignment.centerLeft;
  Alignment rightAlignment = Alignment.centerRight;
  double leftOpacity = 1.0;
  double rightOpacity = 1.0;
  double leftScale = 1.0;
  double rightScale = 1.0;
  bool animating = false;

  @override
  void initState() {
    super.initState();
    currentRoundIndexes = List.generate(
      widget.worldCup.images.length,
      (i) => i,
    );
    nextRoundIndexes = [];
    generateNextImages();
  }

  void generateNextImages() {
    // ✅ 현재 라운드 종료 시 다음 라운드 세팅
    if (currentRoundIndexes.isEmpty) {
      // 1명 남았으면 결과 페이지로 이동
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

    //  애니메이션 초기화
    leftAlignment = Alignment.centerLeft;
    rightAlignment = Alignment.centerRight;
    leftOpacity = 1.0;
    rightOpacity = 1.0;
    leftScale = 1.0;
    rightScale = 1.0;
  }

  void onSelectImage(int selectedIndex) {
    if (animating) return;

    setState(() {
      animating = true;

      if (selectedIndex == 0) {
        // 왼쪽 선택
        leftAlignment = Alignment.center;
        leftScale = 1.2;
        rightAlignment = const Alignment(1.5, 0);
        rightOpacity = 0.0;
        rightScale = 0.8;
      } else {
        // 오른쪽 선택
        rightAlignment = Alignment.center;
        rightScale = 1.2;
        leftAlignment = const Alignment(-1.5, 0);
        leftOpacity = 0.0;
        leftScale = 0.8;
      }
    });

    // 1초 뒤 다음 이미지 로드
    Timer(const Duration(seconds: 1), () {
      setState(() {
        animating = false;
        nextRoundIndexes.add(currentImages[selectedIndex]);

        // 이번 라운드에서 두 이미지 제거
        for (int img in currentImages) {
          currentRoundIndexes.remove(img);
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 왼쪽 이미지
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => onSelectImage(0),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              alignment: leftAlignment,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              child: AnimatedScale(
                                scale: leftScale,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                child: AnimatedOpacity(
                                  opacity: leftOpacity,
                                  duration: const Duration(milliseconds: 500),
                                  child: Image.asset(
                                    cup.images[currentImages[0]],
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const FractionalOffset(0.5, 0.71),
                              child: Text(
                                cup.imageNames[currentImages[0]],
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // 오른쪽 이미지
                    currentImages.length > 1
                        ? Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () => onSelectImage(1),
                              child: Stack(
                                children: [
                                  AnimatedAlign(
                                    alignment: rightAlignment,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    child: AnimatedScale(
                                      scale: rightScale,
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.easeInOut,
                                      child: AnimatedOpacity(
                                        opacity: rightOpacity,
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        child: Image.asset(
                                          cup.images[currentImages[1]],
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const FractionalOffset(
                                      0.5,
                                      0.71,
                                    ),
                                    child: Text(
                                      cup.imageNames[currentImages[1]],
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
