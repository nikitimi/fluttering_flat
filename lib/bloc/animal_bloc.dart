import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_flat/bloc/animal_bloc_events.dart';
import 'package:fluttering_flat/bloc/animal_bloc_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc(super.animal) {
    on<AnimalRenameEvent>((event, emit) {
      state.animals[event.index].name = event.newName;
      emit(AnimalState(state.animals));
    });
  }

  @override
  void onChange(Change<AnimalState> change) {
    // TODO: implement onChange
    super.onChange(change);
    debugPrint('On Change event is fired! -> ${change.toString()}');
  }
}
