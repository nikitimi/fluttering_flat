import 'package:flutter/material.dart';
import 'package:fluttering_flat/bloc/animal_bloc_state.dart';
import 'package:fluttering_flat/utils/colors.dart';
import 'package:fluttering_flat/utils/fonts.dart';

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({super.key, required this.animalInfo});

  final Animal animalInfo;

  static const animalNameStyle = TextStyle(
      fontSize: ThemeFonts.xl,
      fontWeight: FontWeight.w900,
      color: Color(ThemeColors.violet),
      decoration: TextDecoration.none);
  static const titleStyle = TextStyle(
      fontSize: ThemeFonts.md,
      decoration: TextDecoration.none,
      color: Color(ThemeColors.green));
  static const textStyle = TextStyle(
      fontSize: ThemeFonts.sm,
      decoration: TextDecoration.none,
      color: Color(ThemeColors.white));

  static Widget rowWidget(String title, String value) => SizedBox(
      width: 480,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title: ', style: titleStyle),
            SizedBox(
              width: 240,
              child: Text(
                value,
                style: textStyle,
                softWrap: true,
              ),
            )
          ]));

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(ThemeColors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              animalInfo.image,
              height: 120,
            ),
            Container(
              height: 80,
              alignment: Alignment.center,
              child: Text(
                animalInfo.name,
                style: animalNameStyle,
              ),
            ),
            rowWidget("Species", animalInfo.species),
            rowWidget("Description", animalInfo.description),
            rowWidget("Diet", animalInfo.diet),
            rowWidget("Family", animalInfo.family),
            rowWidget("Habitat", animalInfo.habitat),
            rowWidget("Area of habitat", animalInfo.placeOfFound),
            rowWidget("Height", '${animalInfo.heightCm}'),
            rowWidget("Weight", '${animalInfo.weightKg}'),
          ],
        ));
  }
}
