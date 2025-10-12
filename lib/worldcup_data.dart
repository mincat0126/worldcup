class WorldCup {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final List<String> imageNames;

  WorldCup({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.imageNames,
  });
}

final List<WorldCup> worldCups = [
  WorldCup(
    id: 1,
    title: "과일 월드컵",
    description: "가장 좋아하는 과일을 골라보세요!",
    images: [
      "assets/images/apple.jpg",
      "assets/images/banana.jpg",
      "assets/images/watermelon.jpg",
      "assets/images/grapes.jpg",
      "assets/images/orange.jpg",
      "assets/images/peach.jpg",
      "assets/images/pear.jpg",
      "assets/images/melon.jpg",
    ],
    imageNames: ["사과", "바나나", "수박", "포도", "오렌지", "복숭아", "배", "메론"],
  ),
  WorldCup(
    id: 2,
    title: "음식 월드컵",
    description: "가장 맛있는 음식 고르기",
    images: [
      "assets/images/pizza.jpg",
      "assets/images/hamburger.jpg",
      "assets/images/chicken.jpg",
      "assets/images/spaghetti.jpg",
      "assets/images/ramen.jpg",
      "assets/images/pork.jpg",
      "assets/images/steak.jpg",
      "assets/images/gimbap.jpg",
    ],
    imageNames: ["피자", "햄버거", "치킨", "스파게티", "라면", "돼지고기", "스테이크", "김밥"],
  ),
  WorldCup(
    id: 3,
    title: "게임 월드컵",
    description: "",
    images: [
      "assets/images/LOL.jpg",
      "assets/images/overwatch.jpg",
      "assets/images/battlegrounds.jpg",
      "assets/images/minecraft.jpg",
      "assets/images/roblox.jpg",
      "assets/images/fallguys.jpg",
      "assets/images/genshin.jpg",
      "assets/images/mario.jpg",
    ],
    imageNames: [
      "리그 오브 레전드",
      "오버워치",
      "배틀그라운드",
      "마인크래프트",
      "로블록스",
      "폴가이즈",
      "원신",
      "마리오",
    ],
  ),
];
