// ignore_for_file: must_be_immutable, dead_code, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_bloc.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_event.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/bloc/task_state.dart';
import 'package:pro_task_weather/features/clean_tasks/presintaion/pages/task_details.dart';
import 'package:pro_task_weather/features/clean_weeather/domain/services/location_service.dart';

import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_bloc.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_event.dart';
import 'package:pro_task_weather/features/clean_weeather/presintaion/bloc/weather_state.dart';


class AutoWeatherTasksPage extends StatelessWidget {
  AutoWeatherTasksPage({super.key});
  late String title;
  late int search;
  late String desc;
  late String priority;
  late String weatherLat;
  late String weatherLong;
  late String relatedWeather;
  late String imageUrl;
  late DateTime dueDate;
  String chooce = 'chooce';
  List<String> dropDownButton = [' Low ', ' Medium ', ' High ', ' Very High '];
  late int lastElement;
  LocationService locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _buildAddTaskDialog(context);
          await locationService.requestLocationPermission();
          try {
            var position = await locationService.getCurrentLocation();
            weatherLat = position.latitude.toString();
            weatherLong = position.longitude.toString();

            print(
                '--------------------------------- current location is ${position.latitude},${position.longitude}');
          } catch (e) {
            throw (e.toString());
          }
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: _buildTextField(
                    label: "search for task",
                    onChanged: (value) {
                      try {
                        search = int.parse(value);
                      } on FormatException catch (e) {
                        print(e.toString());
                        context.read<TaskBloc>().add(const GetAllTasksEvent());
                      }
                    }),
              ),
              IconButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(GetByIdEvent(id: search));
                  },
                  icon: const Icon(Icons.search))
            ],
          )
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskStateLoading) {
            context.read<TaskBloc>().add(const GetAllTasksEvent());
            return _buildCircularIndicator();
          } else if (state is TaskStateDone) {
            return state.tasks!.isNotEmpty
                ? _buildShowTasks(state)
                : _exceptionHandler(context);
          } else if (state is TaskStateException) {
            return Center(
              child: Text('Error: ${state.firebaseException.plugin}',
                  style: const TextStyle(color: Colors.red)),
            );
          } else if (state is TaskStateSearch) {
            if (search >= 0) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TaskDetails(
                        detailedTask: state.searchId!,
                        imageUrl: state.searchId!.imageUrl,
                      ),
                    ));
                  },
                  leading: IconButton(
                      onPressed: () {
                        _buildUpdateMethod(context, state, search);
                      },
                      icon: const Icon(Icons.edit)),
                  trailing: Checkbox(
                    value: state.searchId!.isDone,
                    onChanged: (value) {
                      context.read<TaskBloc>().add(
                            ChangeStatusTaskEvent(id: state.searchId!.id),
                          );
                    },
                  ),
                  title: Text(state.searchId!.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(state.searchId!.desc),
                  tileColor: Colors.grey[200],
                ),
              );
            } else {
              return _buildCircularIndicator();
            }
          } else {
            context.read<TaskBloc>().add(const GetAllTasksEvent());
            return _buildCircularIndicator();
          }
        },
      ),
    );
  }

//////////////////////////////////////////!                    _exceptionHandler
  Center _exceptionHandler(BuildContext context) {
    lastElement = 0;
    return const Center(
      child: Text("No tasks available",
          style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  }

//////////////////////////////////////////!                    _buildCircularIndicator
  Padding _buildCircularIndicator() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

//////////////////////////////////////////!                    _buildAddTaskDialog
  Future<void> _buildAddTaskDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherStateLoading) {
              context
                  .read<WeatherBloc>()
                  .add(const GetAutoWeatherEvent()); ////////!
              return _buildCircularIndicator();
            } else if (state is WeatherStateException) {
              _exceptionHandler(context);
            } else if (state is WeatherStateDone) {
              relatedWeather = state.weather.current.condition.text;
              imageUrl = state.weather.current.condition.icon;
              return AlertDialog(
                title: const Text("Add Task",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextField(
                        label: 'Task Title',
                        onChanged: (value) => title = value),
                    _buildTextField(
                        label: 'Task Description',
                        onChanged: (value) => desc = value),
                    _buildDatePicker(context),
                    DropdownButton(
                        hint: Text(chooce),
                        items: dropDownButton.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          priority = value!;
                          chooce = priority;
                        })
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.grey)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TaskBloc>().add(
                            AddTaskEvent(
                              taskEntity: TaskEntity(
                                id: ++lastElement,
                                title: title,
                                desc: desc,
                                isDone: false,
                                priority: priority,
                                relatedWeather: relatedWeather,
                                dueDate: dueDate, imageUrl: imageUrl,
                               
                              ),
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text("Add Task"),
                  ),
                ],
              );
            } else {
              return const Text('wait');
            }
            return const Text('wait');
          },
        );
      },
    );
  }

//////////////////////////////////////////!                    _buildTextField
  TextFormField _buildTextField(
      {required String label, required Function(String) onChanged}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }

//////////////////////////////////////////!                    _buildDatePicker
  Widget _buildDatePicker(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Due Date"),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          dueDate = pickedDate;
        }
      },
    );
  }

//////////////////////////////////////////!                    _buildShowTasks
  ListView _buildShowTasks(TaskStateDone state) {
    lastElement = state.tasks!.last.id;
    return ListView.builder(
      itemCount: state.tasks!.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4,
          child: _buildTaskListTile(context, state, index),
        );
      },
    );
  }

//////////////////////////////////////////!                    _buildTaskListTile
  ListTile _buildTaskListTile(
      BuildContext context, TaskStateDone state, int index) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TaskDetails(
            detailedTask: state.tasks![index],
            imageUrl: state.tasks![index].imageUrl,
          ),
        ));
      },
      onLongPress: () {
        context
            .read<TaskBloc>()
            .add(DeleteTaskEvent(taskEntity: state.tasks![index]));
      },
      leading: IconButton(
          onPressed: () {
            _buildUpdateMethod(context, state, index);
          },
          icon: const Icon(Icons.edit)),
      trailing: Checkbox(
        value: state.tasks![index].isDone,
        onChanged: (value) {
          context.read<TaskBloc>().add(
                ChangeStatusTaskEvent(id: state.tasks![index].id),
              );
        },
      ),
      title: Text(state.tasks![index].title,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(state.tasks![index].desc),
      tileColor: Colors.grey[200],
    );
  }

//////////////////////////////////////////!                    _buildUpdateMethod
  Future<dynamic> _buildUpdateMethod(
      BuildContext context, TaskState state, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Task",
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(
                  label: 'Task Title', onChanged: (value) => title = value),
              _buildTextField(
                  label: 'Task Description',
                  onChanged: (value) => desc = value),
              _buildDatePicker(context),
              DropdownButton(
                  hint: Text(chooce),
                  items: dropDownButton.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    priority = value!;
                    chooce = priority;
                  })
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TaskBloc>().add(
                      AddTaskEvent(
                        taskEntity: TaskEntity(
                          id: ++lastElement,
                          title: title,
                          desc: desc,
                          isDone: false,
                          priority: priority,
                          relatedWeather: relatedWeather,
                          dueDate: dueDate, imageUrl: imageUrl,
                       //   imageUrl: imageUrl,
                        ),
                      ),
                    );
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Update Task"),
            ),
          ],
        );
      },
    );
  }
}
