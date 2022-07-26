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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAXFVoXXI7djzm0tr5nR6FcYFeyLe_r7-c',
    appId: '1:59452493783:web:ee608faed4b9ea5c254592',
    messagingSenderId: '59452493783',
    projectId: 'fir-flutter-c2094',
    authDomain: 'fir-flutter-c2094.firebaseapp.com',
    storageBucket: 'fir-flutter-c2094.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbxnyPTlyMFNJR2PaGkABK1x52dlT87Ag',
    appId: '1:59452493783:android:807849e7e56d33df254592',
    messagingSenderId: '59452493783',
    projectId: 'fir-flutter-c2094',
    storageBucket: 'fir-flutter-c2094.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9Ro7fzYtCBX8D98Eb7o4Q76eEQs5vmmk',
    appId: '1:59452493783:ios:b5b7a1f71a715e07254592',
    messagingSenderId: '59452493783',
    projectId: 'fir-flutter-c2094',
    storageBucket: 'fir-flutter-c2094.appspot.com',
    iosClientId: '59452493783-100fmlmksm7i184brnoj63se0eio5q7v.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLogin',
  );
}
