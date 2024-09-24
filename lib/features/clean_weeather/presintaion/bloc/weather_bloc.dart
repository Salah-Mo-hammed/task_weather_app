import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/get_current_weather_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/get_weather_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_event.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_state.dart';
import 'package:pro_task_weather/data_state/data_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  GetWeatherUseCase getWeatherUseCase;
  GetCurrentWeatherUsecase getCurrentWeatherUsecase;

  WeatherBloc(
      {required this.getWeatherUseCase, required this.getCurrentWeatherUsecase})
      : super(const WeatherStateLoading()) {
    on<GetWeatherEvent>(onGetWeather);
    on<GetAutoWeatherEvent>(onGetAutoWeather);
  }

  FutureOr<void> onGetWeather(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    final dataState = await getWeatherUseCase.call(event.location);
    if (dataState is DataSuccess) {
      emit(WeatherStateDone(dataState.data!));
    } else if (dataState is DataFaild) {
      emit(WeatherStateException(dataState.error!));
    }
  }

  FutureOr<void> onGetAutoWeather(
      GetAutoWeatherEvent event, Emitter<WeatherState> emit) async {
    final dataState = await getCurrentWeatherUsecase.call();
    if (dataState is DataSuccess) {
      emit(WeatherStateDone(dataState.data!));
    } else if (dataState is DataFaild) {
      emit(WeatherStateException(dataState.error!));
    }
  }

  
}
