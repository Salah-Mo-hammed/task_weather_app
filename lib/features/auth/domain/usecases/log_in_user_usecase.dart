import 'package:pro_task_weather/data_state/firebase_data_state.dart';
import 'package:pro_task_weather/features/auth/domain/repo/user_repo.dart';

class LogInUserUsecase {
  UserRepo repo;
  LogInUserUsecase( {required this.repo});
 Future<FirebaseDataState<String>> call(String emailAddress, String password) {
    return repo.logInUser(emailAddress, password);
}
}
