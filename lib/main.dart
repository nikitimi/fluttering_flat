import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttering_flat/bloc/animal_bloc.dart';
import 'package:fluttering_flat/pages/animal_bloc_page.dart';
import 'package:fluttering_flat/pages/animal_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalCubit extends Cubit<Animal> {
  AnimalCubit(super.initState);

  void describe() {
    debugPrint(state.name);
  }

  StreamSubscription<Animal> listen() {
    return stream.listen((e) => debugPrint('$e Hello'));
  }

  void renameAnimal(String newName) {
    state.name = newName;
    emit(state);
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
        body: BlocProvider(
            create: (_) => AnimalBloc(Animal(
                "Lion",
                "Panthera leo",
                "Felidae",
                "Grasslands and Savannas",
                "Africa",
                "Carnivore",
                "The lion is a large and powerful wild cat known for its majestic appearance and social behavior.",
                190,
                120,
                "https://fakeimg.pl/500x500/cc6601")),
            child: const AnimalBlocPage()));
  }
}
