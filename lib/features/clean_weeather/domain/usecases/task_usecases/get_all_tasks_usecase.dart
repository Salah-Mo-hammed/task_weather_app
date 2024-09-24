import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class GetAllTasksUsecase {
  TaskRepo taskRepo;
  GetAllTasksUsecase({required this.taskRepo});
  Future<FirebaseDataState<List<TaskEntity>>> call() {
    return taskRepo.getAllTasks();
  }
}
