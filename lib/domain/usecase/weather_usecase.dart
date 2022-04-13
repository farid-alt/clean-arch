import 'package:clean_arch_test2/domain/entities/weather.dart';
import 'package:clean_arch_test2/domain/repos/weather_repo.dart';

class WeatherUsecase {
  final WeatherRepo _weatherRepo;
  WeatherUsecase(this._weatherRepo);
  Future<Weather> getWeather(String cityName) async {
    return _weatherRepo.getWeather(cityName: cityName);
  }
}
