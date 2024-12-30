class CharacterDetailsEntity {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  CharacterDetailsOriginEntity? origin;
  CharacterDetailsOriginEntity? location;
  String? image;
  List<String>? listOfEpisodes;

  CharacterDetailsEntity(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.listOfEpisodes,});
}

class CharacterDetailsOriginEntity {
  String? name;
  String? url;

  CharacterDetailsOriginEntity({this.name, this.url});
}
