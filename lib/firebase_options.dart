// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAhCmSyXArrai15W3y3AoswqC-e0KqeqTE',
    appId: '1:221019381724:web:e7cf8eacf0ba7c79173919',
    messagingSenderId: '221019381724',
    projectId: 'smarthome-88cc3',
    authDomain: 'smarthome-88cc3.firebaseapp.com',
    storageBucket: 'smarthome-88cc3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoi6Ro8QvA5e0q4g6QbsqJ7ZRw17LGFjA',
    appId: '1:221019381724:android:d55ae13c65e5019c173919',
    messagingSenderId: '221019381724',
    projectId: 'smarthome-88cc3',
    storageBucket: 'smarthome-88cc3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZVj7qcbnoMvU-slzOT1xHLbz2hDLtK6I',
    appId: '1:221019381724:ios:0854ab16cc38ae35173919',
    messagingSenderId: '221019381724',
    projectId: 'smarthome-88cc3',
    storageBucket: 'smarthome-88cc3.appspot.com',
    iosBundleId: 'com.example.smartHome',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZVj7qcbnoMvU-slzOT1xHLbz2hDLtK6I',
    appId: '1:221019381724:ios:e7737d8b2c2bf4de173919',
    messagingSenderId: '221019381724',
    projectId: 'smarthome-88cc3',
    storageBucket: 'smarthome-88cc3.appspot.com',
    iosBundleId: 'com.example.smartHome.RunnerTests',
  );
}
