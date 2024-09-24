import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseDataState<T> {
  final T? data;
  final FirebaseException? error;

  const FirebaseDataState({this.data, this.error});
}

class FirebaseDataSuccess<T> extends FirebaseDataState<T> {
  const FirebaseDataSuccess(T data) : super(data: data);
}

class FirebaseDataFaild<T> extends FirebaseDataState<T> {
  const FirebaseDataFaild(FirebaseException error) : super(error: error);
}
