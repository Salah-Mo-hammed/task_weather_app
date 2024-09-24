//import 'package:pro_task_weather/clean_arch/domain/entities/weather_entity.dart';

class TaskEntity {
  int id;
  String title;
  String desc;
  bool isDone;
  String relatedWeather;
  DateTime dueDate;
  String priority;
  String imageUrl;
  // String location;
  //WeatherEntity relatedWeather;
  //DateTime createdAt;
  TaskEntity({required this.imageUrl,
    required this.relatedWeather,
    required this.id,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.dueDate,
    required this.priority,
    // required this.location,
    // required this.relatedWeather,
    // required this.createdAt,
  });
}
