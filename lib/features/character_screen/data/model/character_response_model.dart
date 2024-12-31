import 'package:freezed_annotation/freezed_annotation.dart';
part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  Info? info;
  @JsonKey(name: 'results')
  List<CharacterModel>? characterList;

  CharacterResponseModel({this.info, this.characterList});

  factory CharacterResponseModel.fromJson(Map<String, dynamic> map) => _$CharacterResponseModelFromJson(map);

}

@JsonSerializable()
class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> map) => _$InfoFromJson(map);
}

@JsonSerializable()
class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  CharacterModel(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created});

  factory CharacterModel.fromJson(Map<String, dynamic> map) => _$CharacterModelFromJson(map);
}

@JsonSerializable()
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> map) => _$OriginFromJson(map);
}