import 'package:clean_arch_test2/data/entities/weather_dto.dart';
import 'package:clean_arch_test2/data/services/weather_service.dart';
import 'package:clean_arch_test2/domain/entities/weather.dart';
import 'package:clean_arch_test2/domain/repos/weather_repo.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherService _weatherService;
  WeatherRepoImpl(this._weatherService);
  @override
  Future<Weather> getWeather({required String cityName}) async {
    final res = await _weatherService.getWeather(cityName);
    return res.toModel();
  }
}
