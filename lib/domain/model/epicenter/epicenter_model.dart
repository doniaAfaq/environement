import 'package:json_annotation/json_annotation.dart';
part 'epicenter_model.g.dart';


@JsonSerializable()
class EpicenterModel {
  final int id;
  final String description;
  final int status;
  final String creationDate;
  final String? reason;
  final int cityId;
  final int reportId;
  final double size;
  final double lat;
  final double long;
  final List<PhotoModel> epicenterPhotos;
  final CityModel city;


  EpicenterModel({
    required this.id,
    required this.description,
    required this.status,
    required this.creationDate,
    required this.reason,
    required this.cityId,
    required this.size,
    required this.lat,
    required this.long,
    required this.epicenterPhotos,
    required this.city,
    required this.reportId,
  });

  // factory EpicenterModel.fromJson(Map<String, dynamic> jsonData) {
  //   return EpicenterModel(
  //     id: jsonData['id'] ?? 0,
  //     description: jsonData['description'] ?? '',
  //     status: jsonData['status'] ?? 0,
  //     reportId: jsonData['reportId'] ?? 0,
  //     reason: jsonData['reason'] ?? '',
  //     creationDate: jsonData['creationDate'] ?? '',
  //     cityId: jsonData['cityId'] ?? 0,
  //     size: jsonData['size'] ?? 0.0,
  //     lat: jsonData['lat'] ?? 0.0,
  //     long: jsonData['long'] ?? 0.0,
  //     epicenterPhotos: jsonData['epicenterPhotos'] != null
  //         ? (jsonData['epicenterPhotos'] as List)
  //             .map((i) => PhotoModel.fromJson(i))
  //             .toList()
  //         : [],
  //     city: CityModel.fromJson(jsonData['city']),
  //   );
  // }
  factory EpicenterModel.fromJson(Map<String, dynamic> srcJson) =>
      _$EpicenterModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EpicenterModelToJson(this);


}

@JsonSerializable()
class PhotoModel {
  final int id;
  final String photo;
  final int epicenterId;

  PhotoModel({
    required this.id,
    required this.photo,
    required this.epicenterId,
  });

  // factory PhotoModel.fromJson(Map<String, dynamic> jsonData) {
  //   return PhotoModel(
  //     id: jsonData['id'] ?? 0,
  //     photo: jsonData['photo'] ?? '',
  //     epicenterId: jsonData['epicenterId'] ?? 0,
  //   );
  // }
  factory PhotoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$PhotoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}


@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  final GovernorateModel governorate;

  CityModel({
    required this.id,
    required this.name,
    required this.governorate,
  });

  // factory CityModel.fromJson(Map<String, dynamic> jsonData) {
  //   return CityModel(
  //     id: jsonData['id'] ?? 0,
  //     name: jsonData['name'] ?? '',
  //     governorate: GovernorateModel.fromJson(jsonData['governorate']),
  //   );
  // }

  factory CityModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CityModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

}


@JsonSerializable()
class GovernorateModel {
  final int id;
  final int regionId;
  final String name;
  final RegionModel region;

  GovernorateModel(
      {required this.id,
      required this.name,
      required this.regionId,
      required this.region});

  // factory GovernorateModel.fromJson(Map<String, dynamic> jsonData) {
  //   return GovernorateModel(
  //     id: jsonData['id'] ?? 0,
  //     name: jsonData['name'] ?? '',
  //     regionId: jsonData['regionId'] ?? 0,
  //     region: RegionModel.fromJson(jsonData['region']),
  //   );
  // }


  factory GovernorateModel.fromJson(Map<String, dynamic> srcJson) =>
      _$GovernorateModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GovernorateModelToJson(this);

}


@JsonSerializable()
class RegionModel {
  final int id;
  final String name;

  RegionModel({
    required this.id,
    required this.name,
  });

  // factory RegionModel.fromJson(Map<String, dynamic> jsonData) {
  //   return RegionModel(
  //     id: jsonData['id'] ?? 0,
  //     name: jsonData['name'] ?? '',
  //   );
  // }

  factory RegionModel.fromJson(Map<String, dynamic> srcJson) =>
      _$RegionModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);


}


