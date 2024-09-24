
import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class GetAllTasksEvent extends TasksEvent {
  const GetAllTasksEvent();
}

class AddTaskEvent extends TasksEvent {
  TaskEntity taskEntity;
  AddTaskEvent({required this.taskEntity});
}

class UpdateTaskEvent extends TasksEvent {
  String relatedWeather;
  String title;
  int id;
  String desc;
  bool isDone;
  String priority;
  UpdateTaskEvent(
      {required this.relatedWeather,
      required this.id,
      required this.title,
      required this.desc,
      required this.isDone,
      required this.priority});
}

class DeleteTaskEvent extends TasksEvent {
  TaskEntity taskEntity;

  DeleteTaskEvent({required this.taskEntity});
}

class GetByIdEvent extends TasksEvent {
int id;
  GetByIdEvent({required this.id});
}

class ChangeStatusTaskEvent extends TasksEvent {
  int id;
  ChangeStatusTaskEvent({required this.id});
}
