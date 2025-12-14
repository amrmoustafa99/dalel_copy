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
    apiKey: 'AIzaSyAdbhuPaP1y3tmu-qJjv5QAHNXt56OIHig',
    appId: '1:1084905850564:web:4dba79771ecf3a7b8a6b91',
    messagingSenderId: '1084905850564',
    projectId: 'dalel-app-90181',
    authDomain: 'dalel-app-90181.firebaseapp.com',
    storageBucket: 'dalel-app-90181.firebasestorage.app',
    measurementId: 'G-HZKFVMREJJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQEmkdQUjImXcMWFf24cjS-qFG0DaUgeE',
    appId: '1:1084905850564:android:f155aa98fce2137a8a6b91',
    messagingSenderId: '1084905850564',
    projectId: 'dalel-app-90181',
    storageBucket: 'dalel-app-90181.firebasestorage.app',
  );

}