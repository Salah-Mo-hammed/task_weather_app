// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_task_weather/features/clean_tasks/data/models/task_model.dart';
import 'package:pro_task_weather/data_state/firebase_data_state.dart';

abstract class TaskDataSource {
  Future<FirebaseDataState<List<TaskModel>>> getAllTasks();
  Future<FirebaseDataState<void>> addTask(TaskModel task);
  Future<FirebaseDataState<void>> deleteTask(TaskModel task);
  Future<FirebaseDataState<void>> updateTask(String relatedWeather,
      String title, int id, String desc, bool isDone, String priority);
  Future<FirebaseDataState<TaskModel>> getTaskById(int id);
  Future<FirebaseDataState<void>> markAsDone(int id);
}

class WithFirebase implements TaskDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<FirebaseDataState<void>> addTask(TaskModel task) async {
    try {
      await firestore
          .collection('tasks')
          .doc(task.id.toString())
          .set(task.toJson());
      return const FirebaseDataSuccess<void>(null);
    } on FirebaseException catch (e) {
      return FirebaseDataFaild(e);
    }
  }

  @override
  Future<FirebaseDataState<void>> deleteTask(TaskModel task) async {
    try {
      await firestore.collection('tasks').doc(task.id.toString()).delete();
      return const FirebaseDataSuccess(null);
    } on FirebaseException catch (e) {
      return FirebaseDataFaild(e);
    }
  }

  @override
  Future<FirebaseDataState<List<TaskModel>>> getAllTasks() async {
    try {
      final snapshot = await firestore.collection('tasks').get();
      final data = snapshot.docs.map((doc) {
        return TaskModel.fromJson(doc.data());
      }).toList();
      return FirebaseDataSuccess(data);
    } on FirebaseException catch (e) {
      return FirebaseDataFaild(e);
    }
  }

  @override
  Future<FirebaseDataState<TaskModel>> getTaskById(int id) async {
    try {
      final doc = await firestore.collection('tasks').doc(id.toString()).get();
      if (doc.exists) {
        print(id);
        return FirebaseDataSuccess(TaskModel.fromJson(doc.data()!));
      } else {
        return FirebaseDataFaild(FirebaseException(
            plugin: 'getby id exception in task data source'));
      }
    } on FirebaseException catch (e) {
      return FirebaseDataFaild(e);
    }
  }

  @override
  Future<FirebaseDataState<void>> markAsDone(int id) async {
    try {
      await firestore
          .collection('tasks')
          .doc(id.toString())
          .update({'isDone': true});
      return const FirebaseDataSuccess<void>(null);
    } on FirebaseException catch (e) {
      return FirebaseDataFaild(e);
    }
  }

  @override
  Future<FirebaseDataState<void>> updateTask(String relatedWeather,
      String title, int id, String desc, bool isDone, String priority) async {
    try {
      await firestore.collection('tasks').doc(id.toString()).update({
        'desc': desc,
        'id': id,
        'isDone': isDone,
        'priority': priority,
        'title': title,
        'relatedWeather': relatedWeather,
      });
      return const FirebaseDataSuccess<void>(null);
    } on FirebaseException catch (e) {
      return FirebaseDataFaild(e);
    }
  }
}
