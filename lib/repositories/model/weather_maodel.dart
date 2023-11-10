import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  final double temperature;
  final int humidity;
  final int windSpeed;

  static WeatherModel fromJson(Map<String, dynamic> json) {
    double temperature = json['temperature']['air']['C'] ?? 0.0;
    int humidity = json['humidity']['percent'] ?? 0;
    int windSpeed = (json['wind']['speed']['m_s'] ?? 0.0).toInt();

    return WeatherModel(
      temperature: temperature,
      humidity: humidity,
      windSpeed: windSpeed,
    );
  }

  @override
  List<Object?> get props => [temperature, humidity, windSpeed];
}
