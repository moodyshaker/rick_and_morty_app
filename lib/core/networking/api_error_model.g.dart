// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      error: json['error'] as String,
      isNetworkConnectionError:
          json['isNetworkConnectionError'] as bool? ?? false,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'isNetworkConnectionError': instance.isNetworkConnectionError,
    };
