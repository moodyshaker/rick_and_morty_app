import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_character_model.g.dart';

@JsonSerializable()
class FavouriteCharacterModel {
  @JsonKey(name: '_id')
  int id;
  String name;
  String status;
  String species;
  String image;
  String gender;

  FavouriteCharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.gender,
  });

  factory FavouriteCharacterModel.fromMap(Map<String, dynamic> map) =>
      _$FavouriteCharacterModelFromJson(map);

  Map<String, dynamic> toMap() => _$FavouriteCharacterModelToJson(this);
}
