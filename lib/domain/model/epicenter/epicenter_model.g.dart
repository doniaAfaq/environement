// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epicenter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpicenterModel _$EpicenterModelFromJson(Map<String, dynamic> json) =>
    EpicenterModel(
      id: json['id'] as int,
      description: json['description'] as String,
      status: json['status'] as int,
      creationDate: json['creationDate'] as String,
      reason: json['reason'] as String?,
      cityId: json['cityId'] as int,
      size: (json['size'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      epicenterPhotos: (json['epicenterPhotos'] as List<dynamic>)
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>),
      reportId: json['reportId'] as int,
    );

Map<String, dynamic> _$EpicenterModelToJson(EpicenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'status': instance.status,
      'creationDate': instance.creationDate,
      'reason': instance.reason,
      'cityId': instance.cityId,
      'reportId': instance.reportId,
      'size': instance.size,
      'lat': instance.lat,
      'long': instance.long,
      'epicenterPhotos': instance.epicenterPhotos,
      'city': instance.city,
    };

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      id: json['id'] as int,
      photo: json['photo'] as String,
      epicenterId: json['epicenterId'] as int,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'epicenterId': instance.epicenterId,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
      governorate: GovernorateModel.fromJson(
          json['governorate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governorate': instance.governorate,
    };

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      id: json['id'] as int,
      name: json['name'] as String,
      regionId: json['regionId'] as int,
      region: RegionModel.fromJson(json['region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'regionId': instance.regionId,
      'name': instance.name,
      'region': instance.region,
    };

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
