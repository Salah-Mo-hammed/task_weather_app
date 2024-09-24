import 'package:pro_task_weather/data_state/firebase_data_state.dart';
import 'package:pro_task_weather/features/auth/domain/repo/user_repo.dart';

class RegisterUserUsecase {
  UserRepo repo;
  RegisterUserUsecase({required this.repo});
  Future<FirebaseDataState<void>> call(String emailAddress, String password) {
    return repo.registerUser(emailAddress, password);
  }
}
