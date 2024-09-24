// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pro_task_weather/features/clean_weeather/data/models/weather_model.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/services/location_service.dart';
import 'package:pro_task_weather/data_state/data_state.dart';

abstract class WeatherApiDataSource {
  Future<DataState<WeatherModel>> fetchData(String location);
  Future<DataState<WeatherModel>> fetchAutoWeather();
}

class WithDio implements WeatherApiDataSource {
  String baseUrl = "https://api.weatherapi.com/v1/current.json";
  String apikey = "61cef969e0604995b30141006241209";

  final Dio dio = Dio();
  @override
  Future<DataState<WeatherModel>> fetchData(String location) async {
    try {
      Response response = await dio
          .get(baseUrl, queryParameters: {'key': apikey, 'q': location});
      if (response.statusCode == 200) {
        final data = response.data;
        WeatherModel weather = WeatherModel.fromJson(data);
        return DataSuccess(weather);
      } else {
        return DataFaild(
          DioException(
            response: response,
            message: response.statusMessage,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print('حدث خطأ أثناء جلب الموقع: $e');
      throw (DioException);
    }
  }

  @override
  Future<DataState<WeatherModel>> fetchAutoWeather() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getCurrentLocation();
      double latitude = position.latitude;
      double longitude = position.longitude;
      Response response = await dio.get(baseUrl,
          queryParameters: {"key": apikey, 'q': '$latitude,$longitude'});
      if (response.statusCode == 200) {
        final data = response.data;
        WeatherModel weather = WeatherModel.fromJson(data);
        return DataSuccess(weather);
      } else {
        return DataFaild(
          DioException(
            response: response,
            message: response.statusMessage,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print('حدث خطأ أثناء جلب الموقع: $e');
      throw (DioException);
    }
  }
}
