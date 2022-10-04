import 'package:flutter/material.dart';
import './button.dart';
import './tic_tac_toe_page.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        actions: [
          IconButton(
            onPressed: () {
              // BodyPagepressed(0);
            },
            icon: Icon(Icons.lock_reset),
          )
        ],
      ),
      body: HomePage(),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tic Tac Toe"),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.lock_reset),
//           )
//         ],
//       ),
//       body: BodyPage(),
//     );
//   }
// }
