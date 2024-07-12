import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttering_flat/bloc/animal_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc_state.dart';
import 'package:fluttering_flat/pages/animal_bloc_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_flat/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
      title: 'The Animal Kingdom Kwak!',
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
  static const baseUrl = 'https://freetestapi.com/api/v1/animals';

  Future<List<Animal>> _future(String argumentUrl) async {
    final url = Uri.parse(argumentUrl);
    final response = await http.get(url);
    final List<dynamic> animals = convert.jsonDecode(response.body);

    final keys = [
      "id",
      "name",
      "species",
      "family",
      "habitat",
      "place_of_found",
      "diet",
      "description",
      "weight_kg",
      "height_cm",
      "image"
    ];
    late List<Animal> casted = [];

    for (dynamic animal in animals) {
      casted.add(Animal(
        animal[keys[0]],
        animal[keys[1]],
        animal[keys[2]],
        animal[keys[3]],
        animal[keys[4]],
        animal[keys[5]],
        animal[keys[6]],
        animal[keys[7]],
        animal[keys[8]],
        animal[keys[9]],
        animal[keys[10]],
      ));
    }

    return casted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(ThemeColors.black),
          title: const Text(
            'The Animal Kingdom Kwak!',
            style: TextStyle(color: Color(ThemeColors.green)),
          ),
          actions: <Widget>[
            IconButton(
              color: const Color(ThemeColors.green),
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show the Lion',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('King of the Jungle Roar!')));
              },
            ),
            // IconButton(
            //   icon: const Icon(Icons.navigate_next),
            //   tooltip: 'Go to the next page',
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute<void>(
            //       builder: (BuildContext context) {
            //         return Scaffold(
            //           appBar: AppBar(
            //             title: const Text('Next page'),
            //           ),
            //           body: const Center(
            //             child: Text(
            //               'This is the next page',
            //               style: TextStyle(fontSize: 24),
            //             ),
            //           ),
            //         );
            //       },
            //     ));
            //   },
            // ),
          ],
        ),
        body: FutureBuilder(
            future: _future(baseUrl),
            builder: (BuildContext builder,
                    AsyncSnapshot<List<Animal>> snapshot) =>
                BlocProvider(
                    create: (_) {
                      debugPrint(snapshot.toString());
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AnimalBloc(AnimalState(snapshot.data ?? []));
                      }
                      return AnimalBloc(AnimalState([]));
                    },
                    child: snapshot.connectionState == ConnectionState.done
                        ? const AnimalBlocPage()
                        : const Placeholder(
                            color: Color(ThemeColors.black),
                            child: Text('Loading',
                                style:
                                    TextStyle(color: Color(ThemeColors.white))),
                          ))));
  }
}
