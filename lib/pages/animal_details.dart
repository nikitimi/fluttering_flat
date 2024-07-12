import 'package:flutter/material.dart';
import 'package:fluttering_flat/bloc/animal_bloc_state.dart';
import 'package:fluttering_flat/utils/colors.dart';
import 'package:fluttering_flat/utils/fonts.dart';

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({super.key, required this.animalInfo});
  static const textStyle = TextStyle(
      fontSize: ThemeFonts.lg,
      decoration: TextDecoration.none,
      color: Color(ThemeColors.green));

  final Animal animalInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(ThemeColors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              animalInfo.image,
              height: 120,
            ),
            Text(
              animalInfo.name,
              style: const TextStyle(
                  fontSize: ThemeFonts.xl,
                  fontWeight: FontWeight.bold,
                  color: Color(ThemeColors.violet),
                  decoration: TextDecoration.none),
            ),
            Text(animalInfo.species, style: textStyle),
            Text(animalInfo.description, style: textStyle),
            Text(animalInfo.diet, style: textStyle),
            Text(animalInfo.family, style: textStyle),
            Text(animalInfo.habitat, style: textStyle),
            Text(animalInfo.placeOfFound, style: textStyle),
            Text(animalInfo.heightCm.toString(), style: textStyle),
            Text(animalInfo.weightKg.toString(), style: textStyle),
          ],
        ));
  }
}
