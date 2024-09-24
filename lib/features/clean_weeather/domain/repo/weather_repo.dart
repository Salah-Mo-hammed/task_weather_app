import 'package:pro_task_weather/features/clean_weeather/domain/entities/weather_entity.dart';
import 'package:pro_task_weather/data_state/data_state.dart';

abstract class WeatherRepo {
  Future<DataState<WeatherEntity>> getWeatherByLocation(String location);
  Future<DataState<WeatherEntity>> getCurrentWeather();

}
