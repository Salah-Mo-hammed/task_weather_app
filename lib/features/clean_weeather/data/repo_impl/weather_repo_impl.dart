import 'package:pro_task_weather/features/clean_weeather/data/data_source/remote/weather_api_data_source.dart';
import 'package:pro_task_weather/features/clean_weeather/data/models/weather_model.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/repo/weather_repo.dart';
import 'package:pro_task_weather/data_state/data_state.dart';

class WeatherRepoImpl implements WeatherRepo {
  WeatherApiDataSource apiDataSource;
  WeatherRepoImpl({required this.apiDataSource});

  @override
  Future<DataState<WeatherModel>> getWeatherByLocation(String location) {
    return apiDataSource.fetchData(location);
  }

  @override
  Future<DataState<WeatherModel>> getCurrentWeather() {
    return apiDataSource.fetchAutoWeather();
  }
}
