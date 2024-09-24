// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_bloc.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_event.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_state.dart';


// ignore: must_be_immutable
class WeatherAlone extends StatelessWidget {
  WeatherAlone({super.key});
  late String place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: _buildWeatherBloc());
  }

  BlocBuilder<WeatherBloc, WeatherState> _buildWeatherBloc() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherStateLoading) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => place = value,
                ),
                TextButton(
                    onPressed: () {
                      context
                          .read<WeatherBloc>()
                          .add(GetWeatherEvent(location: place));
                    },
                    child: Text("enter the location"))
              ],
            )),
          );
        } else if (state is WeatherStateDone) {
          return Text(
            state.weather.current.condition.text,
            style: TextStyle(color: Colors.white),
          );
        } else {
          return Text("ahhhhhha");
        }
      },
    );
  }
}
