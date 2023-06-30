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
    apiKey: 'AIzaSyAn1VMY0Hee1SmeAHSdUiTRxkptue_jmt0',
    appId: '1:33955444768:web:21550276811798c6dc6445',
    messagingSenderId: '33955444768',
    projectId: 'govtracksa',
    authDomain: 'govtracksa.firebaseapp.com',
    storageBucket: 'govtracksa.appspot.com',
    measurementId: 'G-G276YCF8P7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxthscPtmP3OflPktk_KXXWMgXrBJpjvc',
    appId: '1:33955444768:android:bff02d9770276ea1dc6445',
    messagingSenderId: '33955444768',
    projectId: 'govtracksa',
    storageBucket: 'govtracksa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACsqpP6zc3mPMKwtzH58Jjj8vouls1AuE',
    appId: '1:33955444768:ios:82b8283614421250dc6445',
    messagingSenderId: '33955444768',
    projectId: 'govtracksa',
    storageBucket: 'govtracksa.appspot.com',
    iosClientId: '33955444768-77bnjqtomfd7kp855ctfu3bb48d3eml9.apps.googleusercontent.com',
    iosBundleId: 'com.example.govTrackSa',
  );
}
