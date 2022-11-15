class IndustrialActivitiesModel {
  final int id;
  final String name;

  IndustrialActivitiesModel({
    required this.id,
    required this.name,
  });

  factory IndustrialActivitiesModel.fromJson(Map<String, dynamic> jsonData) {
    return IndustrialActivitiesModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
