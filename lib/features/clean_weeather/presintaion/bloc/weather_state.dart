import 'package:dio/dio.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/entities/weather_entity.dart';

abstract class WeatherState {
  final WeatherEntity? weatherEntity;
  final DioException? exception;
  const WeatherState({this.weatherEntity, this.exception});
}

class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading();
}

class WeatherStateDone extends WeatherState {
  final WeatherEntity weather;
  const WeatherStateDone(this.weather) : super(weatherEntity: weather);
}

class WeatherStateException extends WeatherState {
  final DioException dioException;
  const WeatherStateException(this.dioException)
      : super(exception: dioException);
}
