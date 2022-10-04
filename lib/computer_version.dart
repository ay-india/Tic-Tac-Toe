import 'package:flutter/material.dart';

import 'dart:math';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key}) : super(key: key);

  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  // int findBestMove() {
  //   return 1;
  // }
  String player = "X";
  String opponent = "O";
  int findBestMove() {
    int bestVal = -1000;
    int bestMove = -1;

    // Traverse all cells, evaluate minimax function for
    // all empty cells. And return the cell with optimal
    // value.
    for (int i = 0; i < 9; i++) {
      // for (int j = 0; j<3; j++)
      // {
      // Check if cell is empty
      if (arr[i] == '') {
        // Make the move
        arr[i] = player;

        // compute evaluation function for this
        // move.
        int moveVal = minimax(0, false);

        // Undo the move
        arr[i] = '';

        // If the value of the current move is
        // more than the best value, then update
        // best/
        if (moveVal > bestVal) {
          bestMove = i;
          bestVal = moveVal;
        }
      }
    }

    // printf("The value of the best Move is : %d\n\n",
    //         bestVal);

    return bestMove;
  }

  int minimax(int depth, bool isMax) {
    int score = evaluate();

    // If Maximizer has won the game return his/her
    // evaluated score
    if (score == 10) return score;

    // If Minimizer has won the game return his/her
    // evaluated score
    if (score == -10) return score;

    // If there are no more moves and no winner then
    // it is a tie
    if (isMovesLeft() == false) return 0;

    // If this maximizer's move
    if (isMax) {
      int best = -1000;

      // Traverse all cells
      for (int i = 0; i < 9; i++) {
        // for (int j = 0; j<3; j++)
        // {
        // Check if cell is empty
        if (arr[i] == '') {
          // Make the move
          arr[i] = player;

          // Call minimax recursively and choose
          // the maximum value
          best = max(best, minimax(depth + 1, !isMax));

          // Undo the move
          arr[i] = '';
        }
        // }
      }
      return best;
    }

    // If this minimizer's move
    else {
      int best = 1000;

      // Traverse all cells
      for (int i = 0; i < 9; i++) {
        // for (int j = 0; j<3; j++)
        // {
        // Check if cell is empty
        if (arr[i] == '') {
          arr[i] = opponent;

          // Call minimax recursively and choose
          // the minimum value
          best = min(best, minimax(depth + 1, !isMax));

          arr[i] = '';
        }
      }
      return best;
    }
  }

  int evaluate() {
    // Checking for Rows for X or O victory.
    for (int row = 0; row < 3; row = row + 3) {
      if (arr[row] == arr[row + 1] && arr[row + 1] == arr[row + 2]) {
        if (arr[row] == player)
          return 10;
        else if (arr[row] == opponent) return -10;
      }
    }

    // Checking for Columns for X or O victory.
    for (int col = 0; col < 3; col++) {
      if (arr[col] == arr[col + 3] && arr[col + 3] == arr[col + 6]) {
        if (arr[col] == player)
          return 10;
        else if (arr[col] == opponent) return -10;
      }
    }

    // Checking for Diagonals for X or O victory.
    if (arr[0] == arr[4] && arr[4] == arr[8]) {
      if (arr[0] == player)
        return 10;
      else if (arr[0] == opponent) return -10;
    }

    if (arr[2] == arr[4] && arr[4] == arr[6]) {
      if (arr[6] == player)
        return 10;
      else if (arr[6] == opponent) return -10;
    }

    // Else if none of them have won then return 0
    return 0;
  }

  bool isMovesLeft() {
    for (int i = 0; i < 9; i++)
      // for (int j = 0; j<3; j++)
      if (arr[i] == '') return true;
    return false;
  }

  double displayFontSize = 32.0;
  Color choice = Colors.red;
  var display = "Player A turns";
  int changer = 0;
  String check = "";
  int flag = 1;
  int set = 1;
  int val = 0;
  int bluePoint = 0;
  int redPoint = 0;
  var turn = 0;
  var arr = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void checkResult() {
    if ((arr[0] == "X" && arr[1] == "X" && arr[2] == "X") ||
        (arr[3] == "X" && arr[4] == "X" && arr[5] == "X") ||
        (arr[6] == "X" && arr[7] == "X" && arr[8] == "X") ||
        (arr[0] == "X" && arr[4] == "X" && arr[8] == "X") ||
        (arr[2] == "X" && arr[4] == "X" && arr[6] == "X") ||
        (arr[0] == "X" && arr[3] == "X" && arr[6] == "X") ||
        (arr[1] == "X" && arr[4] == "X" && arr[7] == "X") ||
        (arr[2] == "X" && arr[5] == "X" && arr[8] == "X")) {
      // display = "Hurray! Player A won";
      showWinner("Red");
      redPoint++;
      displayFontSize = 36.0;
      set = 0;
    } else if ((arr[0] == "O" && arr[1] == "O" && arr[2] == "O") ||
        (arr[3] == "O" && arr[4] == "O" && arr[5] == "O") ||
        (arr[6] == "O" && arr[7] == "O" && arr[8] == "O") ||
        (arr[0] == "O" && arr[4] == "O" && arr[8] == "O") ||
        (arr[2] == "O" && arr[4] == "O" && arr[6] == "O") ||
        (arr[0] == "O" && arr[3] == "O" && arr[6] == "O") ||
        (arr[1] == "O" && arr[4] == "O" && arr[7] == "O") ||
        (arr[2] == "O" && arr[5] == "O" && arr[8] == "O")) {
      // display = "Hurray! Player B won";
      showWinner("Blue");
      bluePoint++;
      set = 0;
      displayFontSize = 36.0;
    } else if (turn > 8) {
      showDraw();
      set = 0;
      displayFontSize = 36.0;
    }
  }

  void showDraw() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Draw"),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                set = 0;
                pressed(0);
                Navigator.of(context).pop();
                // changer++;
              });
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }

  void showWinner(String winner) {
    Color c;
    if (winner == "Red") {
      c = Colors.red;
    } else
      c = Colors.blue;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Text(
              "\" ",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              winner,
              style: TextStyle(color: c, fontSize: 30),
            ),
            const Text(
              " \" is Winner!!.",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                set = 0;
                pressed(0);
                Navigator.of(context).pop();
                // changer++;
              });
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }

  // Future<void> pressed(x) async {
  void pressed(x) {
    String c = x.toString();
    if (check.contains(c) && set == 1) {
      flag = 0;
    } else {
      flag = 1;
      check = check + c;
    }

    if (flag == 1) {
      setState(() {
        if (set == 0) {
          arr = [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
          ];
          changer++;
          set = 1;
          turn = 0;
          // if (changer % 2 == 0)
          //   display = "Player A turns";
          // else
          //   display = "Player B turns";
          check = "";
        } else {
          if (turn % 2 == 0) {
            arr[x] = 'X';
            // if (turn != 8) {
            //   int y = findBestMove();
            //   arr[y] = 'O';
            // }
            choice = Colors.redAccent;
            turn = turn + 2;
            if (changer % 2 != 0)
              display = "Player A turns";
            else
              display = "Player B turns";
          } else {
            arr[x] = 'O';
            turn++;
            choice = Colors.blueAccent;
            if (changer % 2 == 0)
              display = "Player A turns";
            else
              display = "Player B turns";
          }
          // if ((arr[0] == "X" && arr[1] == "X" && arr[2] == "X") ||
          //     (arr[3] == "X" && arr[4] == "X" && arr[5] == "X") ||
          //     (arr[6] == "X" && arr[7] == "X" && arr[8] == "X") ||
          //     (arr[0] == "X" && arr[4] == "X" && arr[8] == "X") ||
          //     (arr[2] == "X" && arr[4] == "X" && arr[6] == "X") ||
          //     (arr[0] == "X" && arr[3] == "X" && arr[6] == "X") ||
          //     (arr[1] == "X" && arr[4] == "X" && arr[7] == "X") ||
          //     (arr[2] == "X" && arr[5] == "X" && arr[8] == "X")) {
          //   display = "Hurray! Player A won";
          //   displayFontSize = 36.0;
          //   set = 0;
          // } else if ((arr[0] == "O" && arr[1] == "O" && arr[2] == "O") ||
          //     (arr[3] == "O" && arr[4] == "O" && arr[5] == "O") ||
          //     (arr[6] == "O" && arr[7] == "O" && arr[8] == "O") ||
          //     (arr[0] == "O" && arr[4] == "O" && arr[8] == "O") ||
          //     (arr[2] == "O" && arr[4] == "O" && arr[6] == "O") ||
          //     (arr[0] == "O" && arr[3] == "O" && arr[6] == "O") ||
          //     (arr[1] == "O" && arr[4] == "O" && arr[7] == "O") ||
          //     (arr[2] == "O" && arr[5] == "O" && arr[8] == "O")) {
          //   display = "Hurray! Player B won";
          //   set = 0;
          //   displayFontSize = 36.0;
          checkResult();
          // if (turn >8) {
          //   display = "Oh! Match Draw";
          //   set = 0;
          //   displayFontSize = 36.0;
          // } else {
          // Future.delayed(const Duration(seconds: 10));
          if (turn <= 8 && set != 0) {
            int y = findBestMove();
            c = y.toString();
            check = check + c;
            arr[y] = 'O';
            checkResult();
          }
          //else {
          //   display = "Oh! Match Draw";
          // }
        }
        // }
      });
    }
  }

  Widget buttonPage(int x) {
    if (arr[x] == 'X') {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 3.0,
            ),
          ),
          padding: EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.14,
          child: OutlineButton(
            onPressed: () => pressed(x),
            // color: Colors.red,
            child: Text(
              arr[x],
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),
            ),
            // child: getText(x),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 3.0,
            ),
          ),
          padding: EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.14,
          child: OutlineButton(
            onPressed: () => pressed(x),
            // color: Colors.red,
            child: Text(arr[x],
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                )),
            // child: getText(x),
          ),
        ),
      );
    }
  }

  Widget getText(int x) {
    if (x % 2 == 0) {
      return Text(arr[x],
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: choice,
          ));
    } else {
      return Text(arr[x],
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: choice,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.home),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.13,
            //   alignment: Alignment.center,
            //   child: Text(
            //     display,
            //     style: TextStyle(
            //         fontSize: displayFontSize,
            //         fontWeight: FontWeight.w400,
            //         color: Colors.blueAccent),
            //   ),
            // ),
            Container(
                // padding: EdgeInsets.all(4.0),
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black54,
                //     width: 3.0,
                //   ),
                // ),
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    redPoint < 10
                        ? Text(
                            "0" + redPoint.toString(),
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 42),
                          )
                        : Text(
                            redPoint.toString(),
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 42),
                          ),
                    const Text(
                      ":",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    bluePoint < 10
                        ? Text(
                            "0" + bluePoint.toString(),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 42),
                          )
                        : Text(
                            bluePoint.toString(),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 42),
                          ),
                  ],
                ),
                Divider(),
                for (int j = 1, x = 0; j <= 3; j++,)
                  Row(
                    children: [
                      for (int i = 1; i <= 3; i++, x++) buttonPage(x),
                    ],
                  ),
              ],
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                // padding: EdgeInsets.all(6.0),
                onPressed: () {
                  setState(() {
                    bluePoint = 0;
                    redPoint = 0;
                    set = 0;
                    pressed(0);
                    // changer++;
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 241, 234, 234),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
