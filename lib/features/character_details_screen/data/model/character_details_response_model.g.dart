// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailsResponseModel _$CharacterDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : CharacterDetailsOrigin.fromJson(
              json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : CharacterDetailsOrigin.fromJson(
              json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      listOfEpisodes:
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$CharacterDetailsResponseModelToJson(
        CharacterDetailsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.listOfEpisodes,
      'url': instance.url,
      'created': instance.created,
    };

CharacterDetailsOrigin _$CharacterDetailsOriginFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailsOrigin(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CharacterDetailsOriginToJson(
        CharacterDetailsOrigin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
