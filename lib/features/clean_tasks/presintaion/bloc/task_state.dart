import 'package:firebase_core/firebase_core.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';

abstract class TaskState {
  final List<TaskEntity>? taskList;
  final FirebaseException? exception;
  final TaskEntity? idTask;
  const TaskState({this.idTask, this.taskList, this.exception});
}

class TaskStateLoading extends TaskState {
  const TaskStateLoading();
}

class TaskStateRefreshed extends TaskState {
  const TaskStateRefreshed();
}

class TaskStateSearch extends TaskState {
  final TaskEntity? searchId;
  const TaskStateSearch(this.searchId):super(idTask: searchId);
}

class TaskStateDone extends TaskState {
  final List<TaskEntity>? tasks;
  
  const TaskStateDone(this.tasks) : super(taskList: tasks);
}

class TaskStateException extends TaskState {
  final FirebaseException firebaseException;
  const TaskStateException(this.firebaseException)
      : super(exception: firebaseException);
}
