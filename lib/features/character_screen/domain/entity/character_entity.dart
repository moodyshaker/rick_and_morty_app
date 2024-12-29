class CharacterEntity {
  CharacterEntityInfo? info;
  List<Character>? characterList;

  CharacterEntity({this.info, this.characterList});
}

class CharacterEntityInfo {
  int? count;
  int? pages;
  CharacterEntityInfo({this.count, this.pages});
}

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? image;
  String? gender;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.image,
    this.gender,
  });
}
