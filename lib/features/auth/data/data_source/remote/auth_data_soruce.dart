// ignore_for_file: avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

class AuthDataSoruce {
  Future<FirebaseDataState<String>> logInUser(
      String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      final String userId = credential.user!.uid;
      return FirebaseDataSuccess(userId);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return FirebaseDataFaild(FirebaseException(
        plugin: "------------------------AUTH DATA SOURCE--------------- "));
  }

  Future<FirebaseDataState<void>> logOutUser() async {
    await FirebaseAuth.instance.signOut();
    return const FirebaseDataSuccess(null);
  }

  Future<FirebaseDataState<String>> registerUser(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final String userId = credential.user!.uid;
      return FirebaseDataSuccess(userId);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return FirebaseDataFaild(FirebaseException(
        plugin: "------------------------AUTH DATA SOURCE--------------- "));
  }
}
