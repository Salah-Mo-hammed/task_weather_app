import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pro_task_weather/features/auth/data/data_source/remote/auth_data_soruce.dart';
import 'package:pro_task_weather/features/auth/data/repo_impl/user_repo_impl.dart';
import 'package:pro_task_weather/features/auth/domain/repo/user_repo.dart';
import 'package:pro_task_weather/features/auth/domain/usecases/log_in_user_usecase.dart';
import 'package:pro_task_weather/features/auth/domain/usecases/log_out_user_usecase.dart';
import 'package:pro_task_weather/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_bloc.dart';
import 'package:pro_task_weather/features/clean_tasks/data/data_source/remote/task_data_source.dart';
import 'package:pro_task_weather/features/clean_tasks/data/repo_impl/task_repo_impl.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_bloc.dart';
import 'package:pro_task_weather/features/clean_weeather/data/data_source/remote/weather_api_data_source.dart';
import 'package:pro_task_weather/features/clean_weeather/data/repo_impl/weather_repo_impl.dart';

import 'package:pro_task_weather/features/clean_weeather/domain/repo/weather_repo.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/get_current_weather_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/get_weather_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/add_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/by_id_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/delete_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/get_all_tasks_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/status_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/update_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_bloc.dart';

GetIt sl = GetIt.instance;
Future<void> initilaizedDependencies() async {
  //! Dio (singletone)
  sl.registerSingleton<Dio>(Dio());

  //! data-> data sources (singletone)
  sl.registerSingleton<WeatherApiDataSource>(WithDio());
  sl.registerSingleton<TaskDataSource>(WithFirebase());
  sl.registerSingleton<AuthDataSoruce>(AuthDataSoruce());

  //! domain-> repo (singletone)
  sl.registerSingleton<WeatherRepo>(
      WeatherRepoImpl(apiDataSource: sl<WeatherApiDataSource>()));
  sl.registerSingleton<TaskRepo>(
      TaskRepoImpl(taskDataSource: sl<TaskDataSource>()));
  sl.registerSingleton<UserRepo>(
      UserRepoImpl(authDataSoruce: sl<AuthDataSoruce>()));

  //! domain-> usecases (singletone)
  sl.registerSingleton<GetWeatherUseCase>(
      GetWeatherUseCase(repo: sl<WeatherRepo>()));
  sl.registerSingleton<GetCurrentWeatherUsecase>(
      GetCurrentWeatherUsecase(repo: sl<WeatherRepo>()));
  sl.registerSingleton<GetAllTasksUsecase>(
      GetAllTasksUsecase(taskRepo: sl<TaskRepo>()));

  sl.registerSingleton<AddTaskUsecase>(
      AddTaskUsecase(taskRepo: sl<TaskRepo>()));

  sl.registerSingleton<DeleteTaskUsecase>(
      DeleteTaskUsecase(taskRepo: sl<TaskRepo>()));

  sl.registerSingleton<UpdateTaskUsecase>(
      UpdateTaskUsecase(taskRepo: sl<TaskRepo>()));

  sl.registerSingleton<ByIdTaskUsecase>(
      ByIdTaskUsecase(taskRepo: sl<TaskRepo>()));

  sl.registerSingleton<StatusTaskUsecase>(
      StatusTaskUsecase(taskRepo: sl<TaskRepo>()));

  sl.registerSingleton<LogInUserUsecase>(
      LogInUserUsecase(repo: sl<UserRepo>()));

  sl.registerSingleton<LogOutUserUsecase>(
      LogOutUserUsecase(repo: sl<UserRepo>()));

  sl.registerSingleton<RegisterUserUsecase>(
      RegisterUserUsecase(repo: sl<UserRepo>()));

  //! blocs
  sl.registerFactory<WeatherBloc>(() => WeatherBloc(
      getWeatherUseCase: sl<GetWeatherUseCase>(),
      getCurrentWeatherUsecase: sl<GetCurrentWeatherUsecase>()));
  sl.registerFactory<TaskBloc>(() => TaskBloc(
      getAllTasksUsecase: sl<GetAllTasksUsecase>(),
      addTaskUsecase: sl<AddTaskUsecase>(),
      deleteTaskUsecase: sl<DeleteTaskUsecase>(),
      updateTaskUsecase: sl<UpdateTaskUsecase>(),
      statusTaskUsecase: sl<StatusTaskUsecase>(),
      byIdTaskUsecase: sl<ByIdTaskUsecase>()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(
      registerUserUsecase: sl<RegisterUserUsecase>(),
      logInUserUsecase: sl<LogInUserUsecase>(),
      logOutUserUsecase: sl<LogOutUserUsecase>()));
}
