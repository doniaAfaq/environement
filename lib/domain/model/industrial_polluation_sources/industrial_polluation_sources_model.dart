class IndustrialPolluationSourcesModel {
  final int id;
  final String name;

  IndustrialPolluationSourcesModel({
    required this.id,
    required this.name,
  });

  factory IndustrialPolluationSourcesModel.fromJson(Map<String, dynamic> jsonData) {
    return IndustrialPolluationSourcesModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
