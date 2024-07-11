import 'package:flutter/material.dart';
import 'package:fluttering_flat/bloc/animal_bloc.dart';
import 'package:fluttering_flat/utils/fonts.dart';

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({super.key, required this.animalInfo});

  final Animal animalInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          animalInfo.image,
          height: 60,
        ),
        Text(
          animalInfo.name,
          style: const TextStyle(
              fontSize: ThemeFonts.lg, fontWeight: FontWeight.bold),
        ),
        Text(animalInfo.species,
            style: const TextStyle(fontSize: ThemeFonts.lg))
      ],
    );
  }
}
