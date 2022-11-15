class RegionModel {
  final int id;
  final String name;

  RegionModel({
    required this.id,
    required this.name,
  });

  factory RegionModel.fromJson(Map<String, dynamic> jsonData) {
    return RegionModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
