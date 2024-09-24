import 'package:pro_task_weather/data_state/firebase_data_state.dart';

abstract class UserRepo {
  Future<FirebaseDataState<String>> logInUser(
      String emailAddress, String password);
  Future<FirebaseDataState<void>> logOutUser();
  Future<FirebaseDataState<String>> registerUser(
      String emailAddress, String password);
  // Future<FirebaseDataState<void>> withGoogle();
}
