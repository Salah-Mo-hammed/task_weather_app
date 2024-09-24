import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

abstract class TaskRepo {
  Future<FirebaseDataState<List<TaskEntity>>> getAllTasks();
  Future<FirebaseDataState<void>> addTask(TaskEntity task);
  Future<FirebaseDataState<void>> deleteTask(TaskEntity task);
  Future<FirebaseDataState<void>> updateTask(String relatedWeather,
      String title, int id, String desc, bool isDone, String priority);
  Future<FirebaseDataState<TaskEntity>> getTaskById(int id);
  Future<FirebaseDataState<void>> markAsDone(int id);
}
