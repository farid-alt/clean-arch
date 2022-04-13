import 'package:clean_arch_test2/domain/entities/weather.dart';

abstract class WeatherRepo {
  Future<Weather> getWeather({required String cityName});
}
