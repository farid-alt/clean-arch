import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_test2/data/repos/weather_repo.dart';
import 'package:clean_arch_test2/data/services/weather_service.dart';
import 'package:clean_arch_test2/domain/entities/weather.dart';
import 'package:clean_arch_test2/domain/usecase/weather_usecase.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState.initial()) {}

  onGetWeather(String cityName) async {
    emit(state.copyWith(isLoading: true));
    WeatherService _weatherService = WeatherService();
    WeatherUsecase weatherUsecase =
        WeatherUsecase(WeatherRepoImpl(_weatherService));
    Weather weather = await weatherUsecase.getWeather(cityName);
    emit(state.copyWith(isLoading: false, weather: weather));
  }
}
