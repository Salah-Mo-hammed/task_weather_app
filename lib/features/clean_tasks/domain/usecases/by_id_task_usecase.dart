import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class ByIdTaskUsecase {
  TaskRepo taskRepo;
  ByIdTaskUsecase({required this.taskRepo});
  Future<FirebaseDataState<TaskEntity>> call(int id) {
    return taskRepo.getTaskById(id);
  }
}
