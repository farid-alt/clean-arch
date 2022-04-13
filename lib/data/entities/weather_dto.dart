import 'package:clean_arch_test2/domain/entities/weather.dart';

class WeatherDto {
  final String cityName;
  final double temperature;
  final String description;
  WeatherDto(
      {required this.cityName,
      required this.description,
      required this.temperature});
  factory WeatherDto.fromjson(Map<String, dynamic> json) => WeatherDto(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp']);
}

extension WeatherMapper on WeatherDto {
  Weather toModel() => Weather(
      cityName: cityName, description: description, temperature: temperature);
}
