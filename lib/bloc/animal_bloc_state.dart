class Animal {
  final int id;
  String name;
  final String species;
  final String family;
  final String habitat;
  final String placeOfFound;
  final String diet;
  final String description;
  final dynamic weightKg;
  final dynamic heightCm;
  final String image;

  Animal(
      this.id,
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

class AnimalState {
  AnimalState(this.animals);

  int index = 0;
  final List<Animal> animals;
}
