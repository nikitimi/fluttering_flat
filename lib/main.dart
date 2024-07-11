import 'package:flutter/material.dart';
import 'package:fluttering_flat/pages/animalList.dart';
import 'package:fluttering_flat/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Animal {
  final String name;
  final String description;
  final int height;

  const Animal(this.name, this.description, this.height);
}

class AnimalCubit extends Cubit<Animal> {
  AnimalCubit(super.initState);

  Future<void> describe() async {
    await for (dynamic animal in stream) {
      debugPrint(animal);
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot My Pie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AnimalCubit(const Animal('sd', 'asd', 43)).describe();
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),
        body: Container(
            color: const Color(ThemeColors.black), child: AnimalList()));
  }
}
