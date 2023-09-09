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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCAChGtfFPPquRHsZn9CX5hr0LC7uW5MGU',
    appId: '1:853449197712:web:ae4bd567675e7783b3f015',
    messagingSenderId: '853449197712',
    projectId: 'apna-kiryana',
    authDomain: 'apna-kiryana.firebaseapp.com',
    storageBucket: 'apna-kiryana.appspot.com',
    measurementId: 'G-VGXREXJKP0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTvLEE-CMjM_VfZLOIAlE9fYux8weSmCg',
    appId: '1:853449197712:android:2bc0d78229f5ff11b3f015',
    messagingSenderId: '853449197712',
    projectId: 'apna-kiryana',
    storageBucket: 'apna-kiryana.appspot.com',
  );
}
