import 'package:flutter/material.dart';
import './tic_tac_toe_page.dart';
import './computer_version.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 218, 215, 215),
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            // alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/ttt.png',
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width * 1,
                  // colorBlendMode: BlendMode.darken,
                ),
                Container(
                  // decoration: BoxDecoration(border: Border.all()),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: const Text(
                    "Tic Tac Toe",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 214, 30, 30)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                // decoration: BoxDecoration(border: Border.all()),
                height: MediaQuery.of(context).size.height * 0.26,
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Column(
                        children: [
                          // RaisedButton(

                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(18.0),
                          //   ),
                          //   padding:
                          //       EdgeInsets.fromLTRB(45.0, 10.0, 45.0, 10.0),
                          //   onPressed: () {},
                          //   child: Text(
                          //     "One Player",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.w800,
                          //       fontStyle: FontStyle.italic,
                          //       // color: Colors.blue[600]
                          //     ),
                          //   ),
                          // ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 45),
                                textStyle: const TextStyle(fontSize: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AutoPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "One Player",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Column(
                        children: [
                          // RaisedButton(
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(18.0)),
                          //   padding:
                          //       EdgeInsets.fromLTRB(45.0, 10.0, 45.0, 10.0),
                          //   onPressed: () {},
                          //   child: Text(
                          //     "Two Player",
                          //     style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.w800,
                          //         fontStyle: FontStyle.italic),
                          //   ),
                          // ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 45),
                                textStyle: const TextStyle(fontSize: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BodyPage(),
                                  ));
                            },
                            child: const Text(
                              "Two Player",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
