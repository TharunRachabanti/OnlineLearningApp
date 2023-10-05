import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Montserrat',
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ""));
  bool player1Turn = true; // true for Human, false for Computer
  bool isComputerTurn = false;
  int movesPlayed = 0;
  String gameResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Player 1 (X)',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Player 2 (O)',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Divider(height: 0),
            SizedBox(height: 5),
            Container(
              constraints: BoxConstraints(minHeight: 500), // Set a minimum height to avoid overflow
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player ${player1Turn ? "1 (X)" : "2 (O)"}\'s Turn',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          int row = index ~/ 3;
                          int col = index % 3;
                          return GestureDetector(
                            onTap: isComputerTurn
                                ? null
                                : () {
                              makeMove(row, col);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: board[row][col] == "X"
                                    ? Colors.orange
                                    : board[row][col] == "O"
                                    ? Colors.teal
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  board[row][col],
                                  style: TextStyle(
                                    fontSize: 72,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
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
            ),
            Divider(height: 0),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: isComputerTurn ? null : resetGame,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Restart Game'),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: gameResult.isNotEmpty ? showResultPopup : null,
              child: Text(
                gameResult,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isComputerTurn
            ? null
            : () {
          if (!player1Turn) {
            return;
          }
          computerMove();
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.computer),
      ),
    );
  }

  void makeMove(int row, int col) {
    if (board[row][col] == "" && !isGameOver() && player1Turn) {
      setState(() {
        board[row][col] = "X"; // Human's move
        player1Turn = false;
        movesPlayed++;

        if (!isGameOver()) {
          isComputerTurn = true;
          Timer(Duration(milliseconds: 500), () {
            computerMove(); // Computer's move after a delay
            isComputerTurn = false;
          });
        }
      });
    }
  }

  void computerMove() {
    // Computer makes a random move
    Random random = Random();
    int emptyCount = 0;
    List<int> emptyCells = [];

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          emptyCount++;
          emptyCells.add(i * 3 + j);
        }
      }
    }

    if (emptyCount > 0) {
      int randomIndex = random.nextInt(emptyCount);
      int row = emptyCells[randomIndex] ~/ 3;
      int col = emptyCells[randomIndex] % 3;

      setState(() {
        board[row][col] = "O"; // Computer's move
        player1Turn = true;
        movesPlayed++;
      });
    }
  }

  bool isGameOver() {
    if (checkWin("X")) {
      setState(() {
        gameResult = "Player 1 (X) wins!";
      });
      return true;
    } else if (checkWin("O")) {
      setState(() {
        gameResult = "Player 2 (O) wins!";
      });
      return true;
    } else if (movesPlayed == 9) {
      setState(() {
        gameResult = "It's a draw!";
      });
      return true;
    }
    return false;
  }

  bool checkWin(String symbol) {
    // Check rows, columns, and diagonals
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == symbol && board[i][1] == symbol && board[i][2] == symbol) {
        return true; // Row win
      }
      if (board[0][i] == symbol && board[1][i] == symbol && board[2][i] == symbol) {
        return true; // Column win
      }
    }
    if (board[0][0] == symbol && board[1][1] == symbol && board[2][2] == symbol) {
      return true; // Diagonal win
    }
    if (board[0][2] == symbol && board[1][1] == symbol && board[2][0] == symbol) {
      return true; // Diagonal win
    }
    return false;
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ""));
      player1Turn = true;
      movesPlayed = 0;
      isComputerTurn = false;
      gameResult = "";
    });
  }

  void showResultPopup() {
    String resultMessage = gameResult;
    if (gameResult == "It's a draw!") {
      resultMessage += "\n\n" + "Good game!";
    } else {
      resultMessage += "\n\n" + "Congratulations!";
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text(resultMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text("Play Again"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
