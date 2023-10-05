import 'package:flutter/material.dart';

void main() {
  runApp(MemoryGame());
}

class MemoryGame extends StatefulWidget {
  const MemoryGame({Key? key}) : super(key: key);

  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE55870),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Memory Game",
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                info_card("Tries", "$tries"),
                info_card("Score", "$score"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tries++;
                        _game.gameImg![index] = _game.cards_list[index];
                        _game.matchCheck.add({index: _game.cards_list[index]});
                      });
                      if (_game.matchCheck.length == 2) {
                        if (_game.matchCheck[0].values.first ==
                            _game.matchCheck[1].values.first) {
                          score += 100;
                          _game.matchCheck.clear();
                        } else {
                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              _game.gameImg![_game.matchCheck[0].keys.first] =
                                  _game.hiddenCardpath;
                              _game.gameImg![_game.matchCheck[1].keys.first] =
                                  _game.hiddenCardpath;
                              _game.matchCheck.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFB46A),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(_game.gameImg![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
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

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/images/hidden.png";
  List<String> cards_list = [
    "assets/images/circle.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/star.png",
    "assets/images/heart.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}

Widget info_card(String title, String info) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(26.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
