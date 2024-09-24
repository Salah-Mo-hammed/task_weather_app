// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_bloc.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_event.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_state.dart';

class LoginOrRegisterWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogIn;
  LoginOrRegisterWidget({super.key, required this.isLogIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          if (state is AuthStateLoading) {
            print(state.runtimeType);
            return _buildColumn(context);
          } else if (state is AuthStateSuccess) {
            print(state.runtimeType);
            return _buildCircularIndecator();
          } else if (state is AuthStateException) {
            print(state.runtimeType);
            return _handle();
          } else {
            print(state.runtimeType);
            return _handle();
          }
        },
      ),
    );
  }

  Center _handle() {
    return const Center(
      child: Text("somthing wrong here",
          style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  }

  Padding _buildColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogIn ? 'Login' : 'Register',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(isLogIn
                      ? AuthLogInEvent(
                          email: emailController.text,
                          password: passwordController.text)
                      : AuthRegisterEvent(
                          email: emailController.text,
                          password: passwordController.text));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(isLogIn ? 'Login' : 'Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding _buildCircularIndecator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: CircularProgressIndicator()),
  );
}
