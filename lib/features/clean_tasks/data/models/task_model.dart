//import 'package:pro_task_weather/clean_arch/data/models/weather_model.dart';

import 'package:pro_task_weather/features/clean_tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({required super.imageUrl,
    required super.id,
    required super.title,
    required super.desc,
    required super.isDone,
    required super.dueDate,
    required super.priority,
    //   required super.location,
    required super.relatedWeather,
    // required super.createdAt
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "imageUrl": imageUrl,

        "isDone": isDone,
        "dueDate": dueDate.toIso8601String(), // Convert DateTime to ISO 8601 string
        "priority": priority,
        //  "location": location,
        "relatedWeather":
            relatedWeather, // Convert WeatherEntity to JSON using the WeatherModel's toJson
        //"createdAt": createdAt.toIso8601String(), // Convert DateTime to ISO 8601 string
      };
  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        imageUrl: json["imageUrl"],

        isDone: json["isDone"],
        dueDate: DateTime.now(), // Convert ISO 8601 string to DateTime
        priority: json["priority"],
        // location: json["location"],
        relatedWeather: json[
            "relatedWeather"], // Convert JSON to WeatherEntity using the WeatherModel's fromJson
        //createdAt: DateTime.parse(json["created_at"]), // Convert ISO 8601 string to DateTime
      );
}
