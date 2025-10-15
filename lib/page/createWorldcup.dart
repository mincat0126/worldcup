import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:worldcup/components/MainButton.dart';
import 'package:worldcup/components/MainTextField.dart';
import 'package:worldcup/components/PikuAppBar.dart';
import 'package:worldcup/my_color.dart';
import 'package:worldcup/worldcup_data.dart';

class CreateWorlcupPage extends StatefulWidget {
  const CreateWorlcupPage({super.key});

  @override
  State<CreateWorlcupPage> createState() => _CreateWorlcupPageState();
}

class _CreateWorlcupPageState extends State<CreateWorlcupPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> images = List.generate(8, (_) => "");
  List<String> iamgesNames = List.generate(8, (_) => "");

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addWorldCup() {
    final newCup = WorldCup(
      id: worldCups.length + 1,
      title: titleController.text,
      description: descriptionController.text,
      images: List.from(images),
      imageNames: List.from(iamgesNames),
    );

    setState(() {
      worldCups.add(newCup);

      images = List.generate(8, (_) => "");
      iamgesNames = List.generate(8, (_) => "");
      titleController.clear();
      descriptionController.clear();
    });
  }

  void updateImage(int index, String path) {
    setState(() {
      images[index] = path;
    });
  }

  void updateImageName(int index, String name) {
    setState(() {
      iamgesNames[index] = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PikuAppBar(),
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
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        right: 20,
                                                      ),
                                                  child: MainTextField(
                                                    fontSize: 15,
                                                    textFieldWidth:
                                                        double.infinity,
                                                    enabledBorderColor:
                                                        MyColor.borderColor,
                                                    enabledBorderWidth: 1,
                                                    controller: titleController,
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
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        right: 20,
                                                      ),
                                                  child: MainTextField(
                                                    fontSize: 15,
                                                    textFieldWidth:
                                                        double.infinity,
                                                    enabledBorderColor:
                                                        MyColor.borderColor,
                                                    enabledBorderWidth: 1,
                                                    controller:
                                                        descriptionController,
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
                                child: MainButton(
                                  buttonWidth: 80,
                                  buttonHeight: 30,
                                  text: "저장하기",
                                  fontSize: 14,
                                  textColor: Colors.white,
                                  textHoverColor: Colors.white,
                                  buttonColor: MyColor.mainColor,
                                  buttonHoverColor: MyColor.subColor,
                                  onPressed: addWorldCup,
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

                                  EditImage(
                                    imageNumber: 1,
                                    onImageSelected: updateImage,
                                    onNameChanged: updateImageName,
                                  ),
                                  EditImage(
                                    imageNumber: 2,
                                    onImageSelected: updateImage,
                                    onNameChanged: updateImageName,
                                  ),
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

class EditImage extends StatefulWidget {
  final int imageNumber;
  final Function(int, String) onImageSelected;
  final Function(int, String) onNameChanged;

  const EditImage({
    super.key,
    required this.imageNumber,
    required this.onImageSelected,
    required this.onNameChanged,
  });

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  Uint8List? imageByte;
  Future<void> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      Uint8List? bytes;

      if (kIsWeb) {
        bytes = await pickedImage.readAsBytes();
      } else {
        bytes = await pickedImage.readAsBytes();
      }

      setState(() {
        imageByte = bytes;
      });

      widget.onImageSelected(widget.imageNumber - 1, pickedImage.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 110,
          color: Color(0xFFf5f5f6),
          child: Center(
            child: Text(
              "${widget.imageNumber}",
              style: TextStyle(
                color: MyColor.mainTextColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => pickImage(context),
          child: Container(
            width: 130,
            height: 110,
            color: Color(0xFFf5f5f6),
            child: imageByte != null
                ? Image.memory(imageByte!, fit: BoxFit.cover)
                : Center(child: Icon(Icons.add_a_photo)),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: MainTextField(
            borderWidth: 50,
            textFieldHeight: 20,
            fontSize: 15,
            textColor: MyColor.mainTextColor,
            enabledBorderColor: MyColor.borderColor,
            enabledBorderWidth: 1,
            onChanged: (value) =>
                widget.onNameChanged(widget.imageNumber - 1, value),
          ),
        ),
      ],
    );
  }
}
