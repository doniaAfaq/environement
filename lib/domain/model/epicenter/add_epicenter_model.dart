import 'dart:io';

import '../../../app/constants.dart';



class AddEpicenterModel {
  final String description;
  final double lat;
  final double long;
  final String reason;
  final String size;
  final int cityId;
  final List<File> photos;

  final List<int> polluationSourcesIds;

  AddEpicenterModel({
    required this.description,
    required this.photos,
    required this.lat,
    required this.long,
    required this.reason,
    required this.size,
    required this.cityId,
    required this.polluationSourcesIds,
  });

  factory AddEpicenterModel.fromJson(Map<String, dynamic> jsonData) {
    return AddEpicenterModel(
      description: jsonData['Description'] ??Constants.empty,
      long: jsonData['Long'] ??Constants.emptyDouble,
      lat: jsonData['Lat'] ?? Constants.emptyDouble,
      photos: jsonData['Photos'] ?? [],
      reason: jsonData['Reason'] ??Constants.empty,
      size: jsonData['Size'] ??Constants.empty,
      cityId: jsonData['CityId'] ?? Constants.zero,
      polluationSourcesIds: jsonData['PolluationSourcesIds'] ??<File>[],
    );
  }
}
