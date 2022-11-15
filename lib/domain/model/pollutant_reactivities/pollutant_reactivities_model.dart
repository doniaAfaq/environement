class PollutantReactivitiesModel {
  final int id;
  final String name;

  PollutantReactivitiesModel({
    required this.id,
    required this.name,
  });

  factory PollutantReactivitiesModel.fromJson(Map<String, dynamic> jsonData) {
    return PollutantReactivitiesModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
