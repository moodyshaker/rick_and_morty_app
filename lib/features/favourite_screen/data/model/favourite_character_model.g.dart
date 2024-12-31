// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteCharacterModel _$FavouriteCharacterModelFromJson(
        Map<String, dynamic> json) =>
    FavouriteCharacterModel(
      id: (json['_id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      image: json['image'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$FavouriteCharacterModelToJson(
        FavouriteCharacterModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'image': instance.image,
      'gender': instance.gender,
    };
