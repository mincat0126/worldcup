import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldcup/components/MainButton.dart';
import 'package:worldcup/components/MainIconButton.dart';
import 'package:worldcup/components/MainTextField.dart';
import 'package:worldcup/page/worldcup.dart';
import 'package:worldcup/worldcup_data.dart';
import 'LoginController.dart';
import 'components/PikuAppbar.dart';
import 'my_color.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchController = TextEditingController();
  List searchingWorldcup = worldCups;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchWorldcup(String query) {
    query = query.trim();

    setState(() {
      if (query.isEmpty) {
        searchingWorldcup = worldCups;
      } else {
        searchingWorldcup = worldCups.where((cup) {
          return cup.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColor.backgroundColor,
        body: Column(
          children: [
            PikuAppBar(),
            Padding(
              padding: const EdgeInsets.only(top: 39, left: 15),
              child: Row(
                children: [
                  MainTextField(
                    fontSize: 15,
                    textFieldWidth: 890,
                    textFieldHeight: 35,
                    hintText: "월드컵 제목 또는 인물 이름 으로 검색하세요.",
                    hintFontSize: 13,
                    onSubmitted: (text) {
                      searchWorldcup(text);
                    },
                    searchController: searchController,
                  ),

                  MainButton(
                    buttonWidth: 50,
                    buttonHeight: 35,
                    text: "검색",
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.white,
                    textHoverColor: Colors.white,
                    buttonColor: MyColor.mainColor,
                    buttonHoverColor: MyColor.subColor,
                    onPressed: () {
                      searchWorldcup(searchController.text);
                    },
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
                itemCount: searchingWorldcup.length,
                itemBuilder: (context, index) {
                  final cup = searchingWorldcup[index];
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
                              MainIconButton(
                                buttonWidth: 105,
                                buttonHeight: 30,
                                buttonIcon: Icon(Icons.play_arrow),
                                text: "시작하기",
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                textColor: Color(0xFFed5565),
                                textHoverColor: Colors.white,
                                buttonBorderColor: Color(0xFFed5565),
                                buttonBorderRadius: 3,
                                buttonBorderWidth: 1,
                                buttonColor: Colors.white,
                                buttonHoverColor: Color(0xFFed5565),
                                navigatePage: WorldcupPage(worldCup: cup),
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
      ),
    );
  }
}
