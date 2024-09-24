import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class DeleteTaskUsecase {
  TaskRepo taskRepo;
  DeleteTaskUsecase({required this.taskRepo});
  Future<FirebaseDataState<void>> call(TaskEntity task) {
    return taskRepo.deleteTask(task);
  }
}
