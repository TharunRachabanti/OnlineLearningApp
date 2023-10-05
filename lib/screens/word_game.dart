import 'package:flutter/material.dart';
import 'dart:math';



class WordGame extends StatefulWidget {
  const WordGame({Key? key}) : super(key: key);

  @override
  State<WordGame> createState() => _WordGameState();
}

class _WordGameState extends State<WordGame> {
  WorldeGame _game = WorldeGame();
  late String word;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WorldeGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Wordle",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GameKeyboard(_game),
        ],
      ),
    );
  }
}

class GameBoard extends StatefulWidget {
  GameBoard(this.game, {Key? key}) : super(key: key);
  WorldeGame game;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.wordleBoard
          .map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: e
            .map((e) => Container(
          padding: EdgeInsets.all(16.0),
          width: 64.0,
          height: 64.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: e.code == 0
                ? Colors.grey.shade800
                : e.code == 1
                ? Colors.green.shade400
                : Colors.amber.shade400,
          ),
          child: Center(
              child: Text(
                e.letter!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ))
            .toList(),
      ))
          .toList(),
    );
  }
}

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, {Key? key}) : super(key: key);
  WorldeGame game;
  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WorldeGame.game_message,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        GameBoard(widget.game),
        SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);

                if (e == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  // setting the game rules
                  if (widget.game.letterId >= 5) {
                    /* widget.game.wordleBoard[widget.game.rowId].replaceRange(
                      0,
                      5,
                      List.generate(5, (index) => Letter("", 3)),
                    ); */
                    String guess = widget.game.wordleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    print(guess);
                    print(WorldeGame.game_guess == guess);
                    if (widget.game.checkWordExist(guess.toLowerCase())) {
                      if (guess == WorldeGame.game_guess) {
                        setState(() {
                          WorldeGame.game_message = "Congratulations🎉";
                          widget.game.wordleBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      } else {
                        print(WorldeGame.game_guess);
                        int listLength = guess.length;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i].toUpperCase();
                          print(
                              "the test: ${WorldeGame.game_guess.contains(char)}");
                          if (WorldeGame.game_guess.contains(char)) {
                            if (WorldeGame.game_guess[i] == char) {
                              setState(() {
                                print(char);
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                print(char);
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            }
                          }
                        }
                        widget.game.rowId++;
                        widget.game.letterId = 0;
                      }
                    } else {
                      WorldeGame.game_message =
                      "the world does not exist try again";
                    }
                  }
                } else {
                  if (widget.game.letterId < 5) {
                    print(widget.game.rowId);
                    widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}






class WorldeGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> word_list = ["world", "fight", "brain", "plane", "earth","robot",""];
  static bool gameOver = false;
  //setting the game row
  static List<Letter> wordleRow = List.generate(
    5,
        (index) => Letter("", 0),
  );

  //Setting the gameBoard
  List<List<Letter>> wordleBoard = List.generate(
      5,
          (index) => List.generate(
        5,
            (index) => Letter("", 0),
      ));

  //Setting the Game Functon
  void passTry() {
    rowId++;
    letterId = 0;
  }

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(word_list.length);
    game_guess = word_list[index].toUpperCase();
  }

  //Setting the game insertion
  void insertWord(index, word) {
    wordleBoard[rowId][index] = word;
  }

  //checking world
  bool checkWordExist(String word) {
    return word_list.contains(word);
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}