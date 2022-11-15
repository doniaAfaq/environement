class WeatherModel {
  final int id;
  final String name;

  WeatherModel({
    required this.id,
    required this.name,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      id: jsonData['id'] ?? 0,
      name: jsonData['name'] ?? '',
    );
  }
}
