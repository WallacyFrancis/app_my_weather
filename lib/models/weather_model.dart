import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final String description;
  final String iconCode;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }

  @override
  List<Object?> get props => [cityName, temperature, description, iconCode];
}
