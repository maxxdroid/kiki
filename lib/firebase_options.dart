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
    apiKey: 'AIzaSyANF4ojMM8dZBG0RVSzXJxpezNKxRgvZGc',
    appId: '1:996459901870:web:8c367a95ab3f60205f0e3f',
    messagingSenderId: '996459901870',
    projectId: 'kiki-production',
    authDomain: 'kiki-production.firebaseapp.com',
    storageBucket: 'kiki-production.appspot.com',
    measurementId: 'G-040ZSDWRQQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxsaUpuE9UMjgA-0ZSGEr_DDARiOFch-U',
    appId: '1:996459901870:android:3d4b61eabf68c6445f0e3f',
    messagingSenderId: '996459901870',
    projectId: 'kiki-production',
    storageBucket: 'kiki-production.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP4T17xG1Vg7cyQTq-pHK9YgSVKgTWMa8',
    appId: '1:996459901870:ios:e95f3f333aa0275e5f0e3f',
    messagingSenderId: '996459901870',
    projectId: 'kiki-production',
    storageBucket: 'kiki-production.appspot.com',
    iosBundleId: 'com.example.kiki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCP4T17xG1Vg7cyQTq-pHK9YgSVKgTWMa8',
    appId: '1:996459901870:ios:e95f3f333aa0275e5f0e3f',
    messagingSenderId: '996459901870',
    projectId: 'kiki-production',
    storageBucket: 'kiki-production.appspot.com',
    iosBundleId: 'com.example.kiki',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyANF4ojMM8dZBG0RVSzXJxpezNKxRgvZGc',
    appId: '1:996459901870:web:ab0ae6ef04ea56a05f0e3f',
    messagingSenderId: '996459901870',
    projectId: 'kiki-production',
    authDomain: 'kiki-production.firebaseapp.com',
    storageBucket: 'kiki-production.appspot.com',
    measurementId: 'G-MW1RM7V870',
  );
}
