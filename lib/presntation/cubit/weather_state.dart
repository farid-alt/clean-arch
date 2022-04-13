part of 'weather_cubit.dart';

class WeatherState {
  final Weather? weather;
  final bool isLoading;
  WeatherState({required this.isLoading, required this.weather});

  factory WeatherState.initial() =>
      WeatherState(isLoading: false, weather: null);

  WeatherState copyWith({bool? isLoading, Weather? weather}) => WeatherState(
      isLoading: isLoading ?? this.isLoading, weather: weather ?? this.weather);
}
