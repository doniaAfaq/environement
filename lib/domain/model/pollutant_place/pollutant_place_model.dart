class PollutantPlaceModel {
  final int id;
  final String name;

  PollutantPlaceModel({
    required this.id,
    required this.name,
  });

  factory PollutantPlaceModel.fromJson(Map<String, dynamic> jsonData) {
    return PollutantPlaceModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
