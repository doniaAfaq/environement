class GovernoratesModel {
  final int id;
  final String name;
  final int regionId;
  final Region region;
  GovernoratesModel(
      {required this.id,
      required this.name,
      required this.regionId,
      required this.region});

  factory GovernoratesModel.fromJson(Map<String, dynamic> jsonData) {
    return GovernoratesModel(
        id: jsonData['id'] ?? 0,
        name: jsonData['name'] ?? '',
        regionId: jsonData['regionId'] ?? 0,
        region: Region.fromJson(jsonData['region']));
  }
}

class Region {
  final int id;
  final String name;

  Region({
    required this.id,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> jsonData) {
    return Region(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
