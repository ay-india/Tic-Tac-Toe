// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './button.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  double displayFontSize = 32.0;
  Color choice = Colors.red;
  var display = "Player A turns";
  int changer = 0;
  String check = "";
  int flag = 1;
  int set = 1;
  int val = 0;
  int redPoint = 0;
  int bluePoint = 0;
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
          if (changer % 2 == 0)
            display = "Player A turns";
          else
            display = "Player B turns";
          check = "";
        } else {
          if (turn % 2 == 0) {
            arr[x] = 'X';
            choice = Colors.redAccent;
            turn++;
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
          } else if (turn == 9) {
            showDraw();
            set = 0;
            displayFontSize = 36.0;
          }
        }
      });
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
          padding: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.14,
          child: OutlineButton(
            onPressed: () => pressed(x),
            // color: Colors.red,
            child: Text(
              arr[x],
              style: const TextStyle(
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
          padding: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.14,
          child: OutlineButton(
            onPressed: () => pressed(x),
            // color: Colors.red,
            child: Text(arr[x],
                style: const TextStyle(
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
        title: const Text("Tic Tac Toe"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              alignment: Alignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.st,
                //   children: const [
                //     Text(
                //       "Player X",
                //       style: TextStyle(
                //           color: Colors.red,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16),
                //     ),
                //     Text(
                //       "Plyare Y",
                //       style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16),
                //     )
                //   ],
                // ),
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
              ]),
              // child: Text(
              //   display,
              //   style: TextStyle(
              //       fontSize: displayFontSize,
              //       fontWeight: FontWeight.w400,
              //       color: Colors.blueAccent),
              // ),
            ),
            // Container(
            //     // padding: EdgeInsets.all(4.0),
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.black54,
            //         width: 2.5,
            //       ),
            //     ),
            //     child: Column(
            //       children: [
            //         for (int j = 1, x = 0; j <= 3; j++,)
            //           Row(
            //             children: [
            //               for (int i = 1; i <= 3; i++, x++) buttonPage(x),
            //             ],
            //           ),
            //       ],
            //     )),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
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
                  style: const TextStyle(
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
