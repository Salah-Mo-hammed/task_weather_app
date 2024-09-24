// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';
import 'package:pro_task_weather/features/auth/domain/usecases/log_in_user_usecase.dart';
import 'package:pro_task_weather/features/auth/domain/usecases/log_out_user_usecase.dart';
import 'package:pro_task_weather/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_event.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RegisterUserUsecase registerUserUsecase;
  LogInUserUsecase logInUserUsecase;
  LogOutUserUsecase logOutUserUsecase;

  AuthBloc({
    required this.registerUserUsecase,
    required this.logInUserUsecase,
    required this.logOutUserUsecase,
  }) : super(const AuthStateLoading()) {
    on<AuthLogInEvent>(_onLogIn);
    on<AuthLogOutEvent>(_onLogOut);
    on<AuthRegisterEvent>(_onRegister);
  }
  FutureOr<void> _onRegister(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    try {
      final dataState =
          await registerUserUsecase.call(event.email, event.password);
      if (dataState is FirebaseDataSuccess) {
        emit(AuthStateSuccess(dataState.data));
      }
    } catch (e) {
      print(
          "----------------------------------------------------${e.toString()}");
    }
  }

  FutureOr<void> _onLogIn(AuthLogInEvent event, Emitter<AuthState> emit) async {
    try {
      final dataState =
          await logInUserUsecase.call(event.email, event.password);
      if (dataState is FirebaseDataSuccess) {
        emit(AuthStateSuccess(dataState.data));
      }
    } catch (e) {
      print(
          "----------------------------------------------------${e.toString()}");
    }
  }

  FutureOr<void> _onLogOut(
      AuthLogOutEvent event, Emitter<AuthState> emit) async {
    try {
      final dataState = await logOutUserUsecase.call();
      if (dataState is FirebaseDataSuccess) {
        emit(const AuthStateLogOut());
      }
    } catch (e) {
      print(
          "----------------------------------------------------${e.toString()}");
    }
  }
}
