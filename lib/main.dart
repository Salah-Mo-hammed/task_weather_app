// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_task_weather/features/auth/presintation/bloc/auth_bloc.dart';
import 'package:pro_task_weather/features/auth/presintation/pages/home_page.dart';
import 'package:pro_task_weather/features/auth/presintation/pages/login_page.dart';
import 'package:pro_task_weather/features/auth/presintation/pages/register_page.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_bloc.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/pages/manual_weather_tasks.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_bloc.dart';
import 'package:pro_task_weather/firebase_options.dart';
import 'package:pro_task_weather/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await initilaizedDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (_) => sl<WeatherBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>(),
        ),
        BlocProvider<TaskBloc>(
          create: (_) => sl<TaskBloc>(),
        )
      ],
      child: MaterialApp(
        home: ManualWeatherTasksPage(),
        routes: {
          '/auth_selection': (context) => AuthSelectionPage(),
          '/login': (context) => LoginPage(), // Define Login Page Route
          '/register': (context) =>
              RegisterPage(), // Define Register Page Route
        },
      ),
    );
  }
}
