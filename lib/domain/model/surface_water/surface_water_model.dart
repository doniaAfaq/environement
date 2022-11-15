class SurfaceWaterModel {
  final int id;
  final String name;

  SurfaceWaterModel({
    required this.id,
    required this.name,
  });

  factory SurfaceWaterModel.fromJson(Map<String, dynamic> jsonData) {
    return SurfaceWaterModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
