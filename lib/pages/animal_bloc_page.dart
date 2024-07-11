import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc.dart';

class AnimalBlocPage extends StatelessWidget {
  const AnimalBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AnimalBloc, Animal>(
          builder: (context, state) {
            return Center(
              child: Text(state.name),
            );
          },
        ),
        IconButton(
            onPressed: () => context
                .read<AnimalBloc>()
                .add(AnimalRenameEvent('Girrrrarrrf!')),
            icon: const Icon(Icons.add_box_outlined))
      ],
    );
  }
}
