import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Animal {
  String name;
  final String species;
  final String family;
  final String habitat;
  final String placeOfFound;
  final String diet;
  final String description;
  final int weightKg;
  final int heightCm;
  final String image;

  Animal(this.name, this.species, this.family, this.habitat, this.placeOfFound,
      this.diet, this.description, this.weightKg, this.heightCm, this.image);
}

class AnimalEvent {}

class AnimalRenameEvent extends AnimalEvent {
  final String newName;

  AnimalRenameEvent(this.newName);
}

class AnimalBloc extends Bloc<AnimalEvent, Animal> {
  AnimalBloc(super.animal) {
    on<AnimalRenameEvent>((event, emit) {
      state.name = event.newName;
      emit(state);
    });
  }

  @override
  void onChange(Change<Animal> change) {
    // TODO: implement onChange
    super.onChange(change);
    debugPrint('On Change event is fired: ${change.toString()}');
  }
}
