import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_event.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_state.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/add_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/by_id_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/delete_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/get_all_tasks_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/status_task_usecase.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/usecases/task_usecases/update_task_usecase.dart';

import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class TaskBloc extends Bloc<TasksEvent, TaskState> {
  GetAllTasksUsecase getAllTasksUsecase;
  AddTaskUsecase addTaskUsecase;
  UpdateTaskUsecase updateTaskUsecase;
  DeleteTaskUsecase deleteTaskUsecase;
  ByIdTaskUsecase byIdTaskUsecase;
  StatusTaskUsecase statusTaskUsecase;
  TaskBloc({
    required this.getAllTasksUsecase,
    required this.addTaskUsecase,
    required this.deleteTaskUsecase,
    required this.updateTaskUsecase,
    required this.statusTaskUsecase,
    required this.byIdTaskUsecase,
  }) : super(const TaskStateLoading()) {
    on<GetAllTasksEvent>(_onGetAllTasks);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<GetByIdEvent>(_onGetById);
    on<ChangeStatusTaskEvent>(_onChangeStatusTask);
  }

  FutureOr<void> _onGetAllTasks(
      GetAllTasksEvent event, Emitter<TaskState> emit) async {
    final taskDataState = await getAllTasksUsecase.call();
    if (taskDataState is FirebaseDataSuccess && taskDataState.data != null) {
      emit(TaskStateDone(taskDataState.data));
    }
  }

  FutureOr<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    final dataState = await addTaskUsecase.call(event.taskEntity);
    if (dataState is FirebaseDataSuccess) {
      emit(const TaskStateRefreshed());
    }
  }

  FutureOr<void> _onUpdateTask(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    final dataState = await updateTaskUsecase.call(event.relatedWeather,
        event.title, event.id, event.desc, event.isDone, event.priority);
    if (dataState is FirebaseDataSuccess) {
      emit(const TaskStateRefreshed());
    }
  }

  FutureOr<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    final dataState = await deleteTaskUsecase.call(event.taskEntity);
    if (dataState is FirebaseDataSuccess) {
      emit(const TaskStateRefreshed());
    }
  }

  FutureOr<void> _onGetById(GetByIdEvent event, Emitter<TaskState> emit) async {
    final dataState = await byIdTaskUsecase.call(event.id);
    if (dataState is FirebaseDataSuccess) {
      emit(TaskStateSearch(dataState.data!));
    }
  }

  FutureOr<void> _onChangeStatusTask(
      ChangeStatusTaskEvent event, Emitter<TaskState> emit) async {
    final dataState = await statusTaskUsecase.call(event.id);
    if (dataState is FirebaseDataSuccess) {
      emit(const TaskStateRefreshed());
    }
  }
}
