// import 'package:flutter/material.dart';

// class buttonPage extends StatefulWidget {
//   final int? x;
//   const buttonPage({Key? key,this.x}) : super(key: key);
   
//   // buttonPage(this.x);

//   @override
//   State<buttonPage> createState() => _buttonPageState();
// }

// class _buttonPageState extends State<buttonPage> {
 
//   var turn = 0;
//   var arr = [
//     '-',
//     '-',
//     '-',
//     '-',
//     '-',
//     '-',
//     '-',
//     '-',
//     '-',
//   ];

//   void pressed() {
//     setState(() {
//       if (turn % 2 == 0) {
//         arr[x] = 'X';
//         turn++;
//       } else {
//         arr[x] = 'O';
//         turn++;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.15,
//         child: OutlineButton(
//           onPressed: () => pressed(),
//           child: Text("*",
//               style: TextStyle(
//                 fontSize: 34,
//                 fontWeight: FontWeight.w600,
//               )),
//         ),
//       ),
//     );
//   }
// }
