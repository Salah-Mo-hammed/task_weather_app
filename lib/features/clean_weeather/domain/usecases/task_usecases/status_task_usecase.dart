import 'package:pro_task_weather/features/clean_tasks/domain/repo/task_repo.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class StatusTaskUsecase {
  TaskRepo taskRepo;
  StatusTaskUsecase({required this.taskRepo});
  Future<FirebaseDataState<void>> call(int id) {
    return taskRepo.markAsDone(id);
  }
}
