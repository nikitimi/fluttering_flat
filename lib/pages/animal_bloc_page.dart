import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc_events.dart';
import 'package:fluttering_flat/bloc/animal_bloc_state.dart';
import 'package:fluttering_flat/pages/animal_details.dart';
import 'package:fluttering_flat/utils/colors.dart';

class TextButtonWithState extends StatefulWidget {
  const TextButtonWithState(
      {super.key, required this.animal, required this.index});

  final Animal animal;
  final int index;

  @override
  State<TextButtonWithState> createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButtonWithState> {
  bool isButtonDisabled = false;

  static String indexFormat(int index) {
    if ('$index'.length == 1) {
      return '  $index';
    }
    return '$index';
  }

  String dynamicTextValue(int newName) {
    return isButtonDisabled
        ? 'No more renames'
        : 'Rename as ${indexFormat(newName)}';
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(dynamicTextValue(widget.index + 1)),
      onPressed: () => isButtonDisabled
          ? null
          : {
              isButtonDisabled = true,
              context.read<AnimalBloc>().add(
                  AnimalRenameEvent(widget.index, widget.animal.id.toString()))
            },
    );
  }
}

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
                return SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AnimalDetails(
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
                            style: const TextStyle(
                                color: Color(ThemeColors.white)),
                          ),
                        ),
                        TextButtonWithState(animal: animal, index: index)
                      ],
                    ));
              }),
        ));
  }
}
