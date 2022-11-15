class PolluationSourcesModel {
  final int id;
  final String name;

  PolluationSourcesModel({
    required this.id,
    required this.name,
  });

  factory PolluationSourcesModel.fromJson(Map<String, dynamic> jsonData) {
    return PolluationSourcesModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
