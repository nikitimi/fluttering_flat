import 'package:flutter/material.dart';
import 'package:fluttering_flat/utils/fonts.dart';

class AnimalInfo {
  final String name;
  final String species;
  final String family;
  final String habitat;
  final String placeOfFound;
  final String diet;
  final String description;
  final int weightKg;
  final int heightCm;
  final String image;

  const AnimalInfo(
      this.name,
      this.species,
      this.family,
      this.habitat,
      this.placeOfFound,
      this.diet,
      this.description,
      this.weightKg,
      this.heightCm,
      this.image);
}

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({super.key, required this.animalInfo});

  final AnimalInfo animalInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
      ),
    );
  }
}
