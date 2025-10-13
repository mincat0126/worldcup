import 'package:flutter/material.dart';
import 'package:worldcup/LoginController.dart';
import 'package:worldcup/components/PikuAppBar.dart';
import 'package:worldcup/my_color.dart';
import 'package:worldcup/worldcup_data.dart';

class CreateWorlcupPage extends StatefulWidget {
  final LoginController controller;
  const CreateWorlcupPage({super.key, required this.controller});

  @override
  State<CreateWorlcupPage> createState() => _CreateWorlcupPageState();
}

class _CreateWorlcupPageState extends State<CreateWorlcupPage> {
  // 추가: 텍스트 필드 값 받을 컨트롤러
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    //  메모리 해제
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PikuAppBar(controller: widget.controller),
            SizedBox(
              width: double.infinity,
              height: 2000,
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Text(
                          "1. 기본정보 수정 / 이미지 업로드",
                          style: TextStyle(
                            color: MyColor.mainColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "이상형 월드컵 기본정보",
                                      style: TextStyle(
                                        color: MyColor.mainTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 120),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 25,
                                          ),
                                          child: Text(
                                            "제목",
                                            style: TextStyle(
                                              color: MyColor.mainTextColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 30,
                                            top: 20,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  //  연결: 제목 컨트롤러
                                                  controller: titleController,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            0,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            MyColor.borderColor,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                0,
                                                              ),
                                                          borderSide: BorderSide(
                                                            color: MyColor
                                                                .borderColor,
                                                            width: 1,
                                                          ),
                                                        ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                0,
                                                              ),
                                                          borderSide:
                                                              BorderSide(
                                                                color: MyColor
                                                                    .mainColor,
                                                                width: 1,
                                                              ),
                                                        ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 8,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 20,
                                                ),
                                                child: Text(
                                                  "이상형월드컵의 제목을 입력하세요. 예) 여자 아이돌 이상형월드컵, 남자 연예인 이상형 월드컵",
                                                  style: TextStyle(
                                                    color:
                                                        MyColor.mainTextColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                              Padding(
                                padding: EdgeInsets.only(left: 120),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 25,
                                          ),
                                          child: Text(
                                            "설명",
                                            style: TextStyle(
                                              color: MyColor.mainTextColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 30,
                                            top: 20,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  //  연결: 설명 컨트롤러
                                                  controller:
                                                      descriptionController,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            0,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            MyColor.borderColor,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                0,
                                                              ),
                                                          borderSide: BorderSide(
                                                            color: MyColor
                                                                .borderColor,
                                                            width: 1,
                                                          ),
                                                        ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                0,
                                                              ),
                                                          borderSide:
                                                              BorderSide(
                                                                color: MyColor
                                                                    .mainColor,
                                                                width: 1,
                                                              ),
                                                        ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 8,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 20,
                                                ),
                                                child: Text(
                                                  "설명, 하고싶은 말 등을 자유롭게 쓰세요.",
                                                  style: TextStyle(
                                                    color:
                                                        MyColor.mainTextColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 175),
                                child: SizedBox(
                                  width: 80,
                                  height: 30,
                                  child: TextButton(
                                    onPressed: () {
                                      //  제목, 설명 가져오기
                                      String title = titleController.text;
                                      String description =
                                          descriptionController.text;

                                      // 새 WorldCup 객체 만들기
                                      WorldCup newWorldCup = WorldCup(
                                        id:
                                            worldCups.length +
                                            1, // 간단히 ID를 리스트 길이 + 1로 설정
                                        title: title,
                                        description: description,
                                        images: [], // 이미지 초기값 비워두기
                                        imageNames: [], // 이미지 이름 초기값 비워두기
                                      );

                                      // 리스트에 추가
                                      setState(() {
                                        worldCups.add(newWorldCup);
                                      });

                                      //  확인용 출력
                                      print(
                                        "새 월드컵 추가됨: ${newWorldCup.title}, ${newWorldCup.description}",
                                      );
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                        Colors.white,
                                      ),
                                      backgroundColor:
                                          WidgetStateProperty.resolveWith<
                                            Color
                                          >((Set<WidgetState> states) {
                                            if (states.contains(
                                              WidgetState.hovered,
                                            )) {
                                              return MyColor.subColor;
                                            }
                                            return MyColor.mainColor;
                                          }),
                                      overlayColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Text("저장하기"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15, top: 50),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 25,
                                  child: Align(
                                    alignment: AlignmentGeometry.centerLeft,
                                    child: Text(
                                      "이상형 월드컵 이미지 업로드 (* 음란물 등록시 임의로 삭제되며, 관련 법률에 의하여 처벌받을 수 있습니다.)",
                                      style: TextStyle(
                                        color: MyColor.mainTextColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15, top: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: Align(
                                    alignment: AlignmentGeometry.centerLeft,
                                    child: Text(
                                      "이미지 이름 수정/삭제",
                                      style: TextStyle(
                                        color: MyColor.mainTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Color(0xFFe7e7e7),
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsGeometry.only(
                                            left: 5,
                                            top: 8,
                                          ),
                                          child: Text(
                                            "번호",
                                            style: TextStyle(
                                              color: MyColor.mainTextColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Color(0xFFe7e7e7),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          "이미지",
                                          style: TextStyle(
                                            color: MyColor.mainTextColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 430,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Color(0xFFe7e7e7),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          "이름 변경",
                                          style: TextStyle(
                                            color: MyColor.mainTextColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  EditImage(imageNumber: 1),
                                  EditImage(imageNumber: 2),
                                  EditImage(imageNumber: 3),
                                  EditImage(imageNumber: 4),
                                  EditImage(imageNumber: 5),
                                  EditImage(imageNumber: 6),
                                  EditImage(imageNumber: 7),
                                  EditImage(imageNumber: 8),
                                ],
                              ),
                            ],
                          ),
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
    );
  }
}

class EditImage extends StatelessWidget {
  final int imageNumber;

  const EditImage({super.key, required this.imageNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 110,
          decoration: BoxDecoration(
            color: Color(0xFFf5f5f6),
            border: Border.all(color: Color(0xFFe7e7e7), width: 1),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 5, top: 8),
            child: Text(
              "$imageNumber",
              style: TextStyle(
                color: MyColor.mainTextColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: 130,
          height: 110,
          decoration: BoxDecoration(
            color: Color(0xFFf5f5f6),
            border: Border.all(color: Color(0xFFe7e7e7), width: 1),
          ),
        ),
        Container(
          width: 430,
          height: 110,
          decoration: BoxDecoration(
            color: Color(0xFFf9f9f9),
            border: Border.all(color: Color(0xFFe7e7e7), width: 1),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(5),
            child: SizedBox(
              width: 50,
              height: 20,
              child: TextField(
                style: TextStyle(fontSize: 15, color: MyColor.mainTextColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,

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
          ),
        ),
      ],
    );
  }
}
