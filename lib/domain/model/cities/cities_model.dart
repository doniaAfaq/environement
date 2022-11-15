class CitiesModel {
  final int id;
  final String name;
  final int governorateId;
  final Governorate governorate;
  CitiesModel(
      {required this.id,
      required this.name,
      required this.governorateId,
      required this.governorate});

  factory CitiesModel.fromJson(Map<String, dynamic> jsonData) {
    return CitiesModel(
        id: jsonData['id'] ?? 0,
        name: jsonData['name'] ?? '',
        governorateId: jsonData['governorateId'] ?? 0,
        governorate: Governorate.fromJson(jsonData['governorate']));
  }
}

class Governorate {
  final int id;
  final String name;

  Governorate({
    required this.id,
    required this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> jsonData) {
    return Governorate(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
