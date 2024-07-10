import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttering_flat/pages/animalDetails.dart';
import 'package:fluttering_flat/utils/colors.dart';
import 'package:fluttering_flat/utils/fonts.dart';
import 'package:http/http.dart' as http;

class AnimalList extends StatelessWidget {
  const AnimalList({super.key});

  static const baseUrl = 'https://freetestapi.com/api/v1/animals';

  Future<String> _baseApi(String argumentUrl) async {
    final url = Uri.parse(argumentUrl);
    final response = await http.get(url);
    return response.body;
  }

  Widget animalList(ConnectionState connectionState, String? data) {
    switch (connectionState) {
      case ConnectionState.done:
        if (data!.isNotEmpty) {
          dynamic animalReference = jsonDecode(data);

          return ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                dynamic animals = animalReference[index];
                return ListTile(
                    tileColor: const Color(ThemeColors.violet),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AnimalDetails(
                                  animalInfo: AnimalInfo(
                                      animals["name"],
                                      animals["species"],
                                      animals["family"],
                                      animals["habitat"],
                                      animals["place_of_found"],
                                      animals["diet"],
                                      animals["description"],
                                      animals["weight_kg"],
                                      animals["height_cm"],
                                      animals["image"]))));
                    },
                    title: Text(animals['name'],
                        style: const TextStyle(
                            color: Color(ThemeColors.white),
                            fontSize: ThemeFonts.lg,
                            decoration: TextDecoration.none)));
              });
        }
        return const Text("No Data");
      case ConnectionState.none:
        return const Text('Connection None');
      case ConnectionState.waiting:
        return const Text('Connection Waiting');
      case ConnectionState.active:
        return const Text('Connection Active');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: _baseApi(baseUrl),
            builder: (BuildContext builder,
                    AsyncSnapshot<String> asyncSnapshot) =>
                animalList(asyncSnapshot.connectionState, asyncSnapshot.data)));
  }
}
