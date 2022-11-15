// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all-epicenter-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEpicenterModel _$AllEpicenterModelFromJson(Map<String, dynamic> json) =>
    AllEpicenterModel(
      epicenterModel: (json['epicenterModel'] as List<dynamic>)
          .map((e) => EpicenterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['totalItems'] as String,
    );

Map<String, dynamic> _$AllEpicenterModelToJson(AllEpicenterModel instance) =>
    <String, dynamic>{
      'epicenterModel': instance.epicenterModel,
      'totalItems': instance.totalItems,
    };
