import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc_events.dart';
import 'package:fluttering_flat/bloc/animal_bloc_state.dart';
import 'package:fluttering_flat/pages/animal_details.dart';
import 'package:fluttering_flat/utils/colors.dart';

class AnimalBlocPage extends StatelessWidget {
  const AnimalBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(ThemeColors.black),
        child: BlocBuilder<AnimalBloc, AnimalState>(
          builder: (context, state) => ListView.builder(
              itemCount: state.animals.length,
              itemBuilder: (BuildContext context, int index) {
                Animal animal = state.animals[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AnimalDetails(
                                  animalInfo: Animal(
                                      animal.id,
                                      animal.name,
                                      animal.species,
                                      animal.family,
                                      animal.habitat,
                                      animal.placeOfFound,
                                      animal.diet,
                                      animal.description,
                                      animal.weightKg,
                                      animal.heightCm,
                                      animal.image)))),
                      child: Text(
                        animal.name,
                        style: const TextStyle(color: Color(ThemeColors.white)),
                      ),
                    ),
                    IconButton(
                      onPressed: () => context
                          .read<AnimalBloc>()
                          .add(AnimalRenameEvent(index, animal.id.toString())),
                      icon: const Icon(Icons.add_box_outlined),
                      color: const Color(ThemeColors.green),
                    )
                  ],
                );
              }),
        ));
  }
}
