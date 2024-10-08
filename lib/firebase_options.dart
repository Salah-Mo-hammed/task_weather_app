// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCaOc2fSahbAwWNVKlS4wi8MZXyo4WvKGU',
    appId: '1:48984697145:web:0c3b27129eea8208d4e0e8',
    messagingSenderId: '48984697145',
    projectId: 'pro-task-weather',
    authDomain: 'pro-task-weather.firebaseapp.com',
    storageBucket: 'pro-task-weather.appspot.com',
    measurementId: 'G-XG6N3C8MDE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbU2kNQUXNsAwGl3u_pMB7DlV8KTZJpzQ',
    appId: '1:48984697145:android:0be04c2523260a34d4e0e8',
    messagingSenderId: '48984697145',
    projectId: 'pro-task-weather',
    storageBucket: 'pro-task-weather.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClScueX3YcJ30j2TgBMKe0mv10KSPHZUQ',
    appId: '1:48984697145:ios:0bd1b7ba977397b6d4e0e8',
    messagingSenderId: '48984697145',
    projectId: 'pro-task-weather',
    storageBucket: 'pro-task-weather.appspot.com',
    iosBundleId: 'com.example.proTaskWeather',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClScueX3YcJ30j2TgBMKe0mv10KSPHZUQ',
    appId: '1:48984697145:ios:0bd1b7ba977397b6d4e0e8',
    messagingSenderId: '48984697145',
    projectId: 'pro-task-weather',
    storageBucket: 'pro-task-weather.appspot.com',
    iosBundleId: 'com.example.proTaskWeather',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCaOc2fSahbAwWNVKlS4wi8MZXyo4WvKGU',
    appId: '1:48984697145:web:d067916b1e37f2ced4e0e8',
    messagingSenderId: '48984697145',
    projectId: 'pro-task-weather',
    authDomain: 'pro-task-weather.firebaseapp.com',
    storageBucket: 'pro-task-weather.appspot.com',
    measurementId: 'G-BEEB27ZSM1',
  );
}
