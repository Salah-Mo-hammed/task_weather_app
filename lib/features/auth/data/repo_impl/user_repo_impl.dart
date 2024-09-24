import 'package:pro_task_weather/data_state/firebase_data_state.dart';
import 'package:pro_task_weather/features/auth/data/data_source/remote/auth_data_soruce.dart';
import 'package:pro_task_weather/features/auth/domain/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  AuthDataSoruce authDataSoruce;
  UserRepoImpl({required this.authDataSoruce});
  @override
  Future<FirebaseDataState<String>> logInUser(
      String emailAddress, String password) async {
    return await authDataSoruce.logInUser(emailAddress, password);
  }

  @override
  Future<FirebaseDataState<void>> logOutUser() async {
    return await authDataSoruce.logOutUser();
  }

  @override
  Future<FirebaseDataState<String>> registerUser(
      String emailAddress, String password) async {
    return await authDataSoruce.registerUser(emailAddress, password);
  }
}
