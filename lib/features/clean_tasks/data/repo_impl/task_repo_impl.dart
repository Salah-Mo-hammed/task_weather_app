import 'package:pro_task_weather/features/clean_tasks/data/data_source/remote/task_data_source.dart';
import 'package:pro_task_weather/features/clean_tasks/data/models/task_model.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class TaskRepoImpl implements TaskRepo {
  TaskDataSource taskDataSource;
  TaskRepoImpl({required this.taskDataSource});
  @override
  Future<FirebaseDataState<void>> addTask(TaskEntity task) {
    TaskModel taskModel = TaskModel(
      id: task.id,
      title: task.title,
      desc: task.desc,
      imageUrl: task.imageUrl,
      isDone: task.isDone,
      dueDate: task.dueDate,
      priority: task.priority,
      //  location: task.location,
      relatedWeather: task.relatedWeather,
      //createdAt: task.createdAt
    );

    return taskDataSource.addTask(taskModel);
  }

  @override
  Future<FirebaseDataState<void>> deleteTask(TaskEntity task) {
    TaskModel taskModel = TaskModel(
      id: task.id,
      title: task.title,
      desc: task.desc,
      isDone: task.isDone,
      dueDate: task.dueDate,
      priority: task.priority,
      imageUrl: task.imageUrl,
      // location: task.location,
      relatedWeather: task.relatedWeather,
      //createdAt: task.createdAt
    );
    return taskDataSource.deleteTask(taskModel);
  }

  @override
  Future<FirebaseDataState<List<TaskEntity>>> getAllTasks() {
    return taskDataSource.getAllTasks();
  }

  @override
  Future<FirebaseDataState<TaskEntity>> getTaskById(int id) {
    return taskDataSource.getTaskById(id);
  }

  @override
  Future<FirebaseDataState<void>> markAsDone(int id) {
    return taskDataSource.markAsDone(id);
  }

  @override
  Future<FirebaseDataState<void>> updateTask(String relatedWeather,
      String title, int id, String desc, bool isDone, String priority) {
    return taskDataSource.updateTask(
        relatedWeather, title, id, desc, isDone, priority);
  }
}
