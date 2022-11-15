class PotentialPollutantsModel {
  final int id;
  final String name;

  PotentialPollutantsModel({
    required this.id,
    required this.name,
  });

  factory PotentialPollutantsModel.fromJson(Map<String, dynamic> jsonData) {
    return PotentialPollutantsModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
