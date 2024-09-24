import 'package:pro_task_weather/data_state/firebase_data_state.dart';
import 'package:pro_task_weather/features/auth/domain/repo/user_repo.dart';

class LogOutUserUsecase {
  UserRepo repo;
  LogOutUserUsecase({required this.repo});
  Future<FirebaseDataState<void>> call() {
    return repo.logOutUser();
  }
}
