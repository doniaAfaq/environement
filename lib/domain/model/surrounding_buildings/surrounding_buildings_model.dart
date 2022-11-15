class SurroundingBuildingsModel {
  final int id;
  final String name;

  SurroundingBuildingsModel({
    required this.id,
    required this.name,
  });

  factory SurroundingBuildingsModel.fromJson(Map<String, dynamic> jsonData) {
    return SurroundingBuildingsModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
