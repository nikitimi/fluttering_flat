class AnimalEvent {}

class AnimalRenameEvent extends AnimalEvent {
  final int index;
  final String newName;

  AnimalRenameEvent(this.index, this.newName);
}
