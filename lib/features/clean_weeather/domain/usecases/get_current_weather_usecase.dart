

import 'package:pro_task_weather/features/clean_weeather/domain/entities/weather_entity.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/repo/weather_repo.dart';
import 'package:pro_task_weather/data_state/data_state.dart';

class GetCurrentWeatherUsecase {
  WeatherRepo repo;
  GetCurrentWeatherUsecase({required this.repo});
    Future<DataState<WeatherEntity>> call() {
    return repo.getCurrentWeather();
  }
}
