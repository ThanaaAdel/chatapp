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
    apiKey: 'AIzaSyBtTxC3rE61y01VTFclMFYn6xJIfHE3h1c',
    appId: '1:483479735764:web:62dc235b189b28fd51da41',
    messagingSenderId: '483479735764',
    projectId: 'chat-app-ca765',
    authDomain: 'chat-app-ca765.firebaseapp.com',
    storageBucket: 'chat-app-ca765.appspot.com',
    measurementId: 'G-K59CQVHKV3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvcajYVvTnty3TcoTP0UsuLCZ6mRtmQaY',
    appId: '1:483479735764:android:0d62b6990861eeaf51da41',
    messagingSenderId: '483479735764',
    projectId: 'chat-app-ca765',
    storageBucket: 'chat-app-ca765.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg77GzoWLECSP0l98e5l-Ffg4IW76-Krg',
    appId: '1:483479735764:ios:5c0a3ed25325bcd951da41',
    messagingSenderId: '483479735764',
    projectId: 'chat-app-ca765',
    storageBucket: 'chat-app-ca765.appspot.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg77GzoWLECSP0l98e5l-Ffg4IW76-Krg',
    appId: '1:483479735764:ios:5c0a3ed25325bcd951da41',
    messagingSenderId: '483479735764',
    projectId: 'chat-app-ca765',
    storageBucket: 'chat-app-ca765.appspot.com',
    iosBundleId: 'com.example.untitled',
  );
}