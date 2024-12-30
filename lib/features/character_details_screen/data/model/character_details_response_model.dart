import 'package:json_annotation/json_annotation.dart';

part 'character_details_response_model.g.dart';

@JsonSerializable()
class CharacterDetailsResponseModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  @JsonKey(name: 'origin')
  CharacterDetailsOrigin? origin;
  @JsonKey(name: 'location')
  CharacterDetailsOrigin? location;
  String? image;
  @JsonKey(name: 'episode')
  List<String>? listOfEpisodes;
  String? url;
  String? created;

  CharacterDetailsResponseModel(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.listOfEpisodes,
      this.url,
      this.created});

  factory CharacterDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailsResponseModelFromJson(json);
}

@JsonSerializable()
class CharacterDetailsOrigin {
  String? name;
  String? url;

  CharacterDetailsOrigin({this.name, this.url});

  factory CharacterDetailsOrigin.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailsOriginFromJson(json);
}
