import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> letters = const ["A", 'B', "C", 'D'];

  Widget itemBuilder(BuildContext context, int index) {
    final String finalLetter = letters[index];

    Row columnItemBuilder(BuildContext context, int index) {
      return Row(
        children: <Text>[
          Text(
            finalLetter,
          )
        ],
      );
    }

    return Column(
      children: <Widget>[ListView.builder(
          itemCount: letters.length,
          itemBuilder: columnItemBuilder
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(100, 100, 50, 1),
      height: 1024,
      width: 360,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: letters.length,
          itemBuilder: itemBuilder,
        )
    );
  }
}
