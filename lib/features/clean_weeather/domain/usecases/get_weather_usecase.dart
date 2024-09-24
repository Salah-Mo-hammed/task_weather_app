

import 'package:pro_task_weather/features/clean_weeather/domain/entities/weather_entity.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/repo/weather_repo.dart';
import 'package:pro_task_weather/data_state/data_state.dart';

class GetWeatherUseCase {
  WeatherRepo repo;
  GetWeatherUseCase({required this.repo});
  Future<DataState<WeatherEntity>> call(String location) {
    return repo.getWeatherByLocation(location);
  }
}
