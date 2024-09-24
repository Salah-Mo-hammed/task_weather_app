import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class UpdateTaskUsecase {
  TaskRepo taskRepo;
  UpdateTaskUsecase({required this.taskRepo});
  Future<FirebaseDataState<void>> call(String relatedWeather, String title,
      int id, String desc, bool isDone, String priority) {
    return taskRepo.updateTask(
        relatedWeather, title, id, desc, isDone, priority);
  }
}
