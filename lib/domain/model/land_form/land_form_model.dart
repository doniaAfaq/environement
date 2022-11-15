class LandFormModel {
  final int id;
  final String name;

  LandFormModel({
    required this.id,
    required this.name,
  });

  factory LandFormModel.fromJson(Map<String, dynamic> jsonData) {
    return LandFormModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
