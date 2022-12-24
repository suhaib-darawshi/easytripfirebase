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
    apiKey: 'AIzaSyAjnTEi43vvmzjiA4PdvwQmaxbSLCFh1RY',
    appId: '1:751834767614:web:70ddb94b9285c120bc85af',
    messagingSenderId: '751834767614',
    projectId: 'trips-772ce',
    authDomain: 'trips-772ce.firebaseapp.com',
    storageBucket: 'trips-772ce.appspot.com',
    measurementId: 'G-TCCPQVQZPB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzWJVgon3ty1ufbPy1flBi01dI-T5qm3I',
    appId: '1:751834767614:android:f4faa95fcae779f5bc85af',
    messagingSenderId: '751834767614',
    projectId: 'trips-772ce',
    storageBucket: 'trips-772ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDG9KihNdu63SSRJE2tSX-l9U_hA63EXU4',
    appId: '1:751834767614:ios:93ce0c0af56cc19dbc85af',
    messagingSenderId: '751834767614',
    projectId: 'trips-772ce',
    storageBucket: 'trips-772ce.appspot.com',
    iosClientId: '751834767614-prejq9ujs09mhpqeper9hr6j310699hk.apps.googleusercontent.com',
    iosBundleId: 'com.example.easyTrip',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDG9KihNdu63SSRJE2tSX-l9U_hA63EXU4',
    appId: '1:751834767614:ios:93ce0c0af56cc19dbc85af',
    messagingSenderId: '751834767614',
    projectId: 'trips-772ce',
    storageBucket: 'trips-772ce.appspot.com',
    iosClientId: '751834767614-prejq9ujs09mhpqeper9hr6j310699hk.apps.googleusercontent.com',
    iosBundleId: 'com.example.easyTrip',
  );
}
