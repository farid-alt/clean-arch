import 'dart:convert';

import 'package:clean_arch_test2/data/entities/weather_dto.dart';
import 'package:dio/dio.dart';

class WeatherService {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5";
  static const API_KEY = "3c0fd860048e51cf7646456e7607c361";
  final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<WeatherDto> getWeather(String cityName) async {
    final response = await _dio.get('/weather', queryParameters: {
      'q': cityName,
      'appid': API_KEY,
    });
    return WeatherDto.fromjson(response.data);
  }
}
