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
    apiKey: 'AIzaSyB7mCoukpzumVpeoT6a94zS1b8l80rVqjs',
    appId: '1:831823701566:web:7922ffae284fbee822936f',
    messagingSenderId: '831823701566',
    projectId: 'somsomhouse-35f10',
    authDomain: 'somsomhouse-35f10.firebaseapp.com',
    storageBucket: 'somsomhouse-35f10.appspot.com',
    measurementId: 'G-R7Z7GJ2DZP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXptM8vPduZkK1do3fr3VxvzU3OuVqiu8',
    appId: '1:831823701566:android:fe036aac2cb1ea6f22936f',
    messagingSenderId: '831823701566',
    projectId: 'somsomhouse-35f10',
    storageBucket: 'somsomhouse-35f10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJmh_Ov2fTbcIerjTGho_sXluzD1vw9uw',
    appId: '1:831823701566:ios:aba7fa03cb037cad22936f',
    messagingSenderId: '831823701566',
    projectId: 'somsomhouse-35f10',
    storageBucket: 'somsomhouse-35f10.appspot.com',
    iosClientId: '831823701566-kshneeptrnvbdkc4m5eb1h49968gmc9q.apps.googleusercontent.com',
    iosBundleId: 'com.example.somsomhouse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJmh_Ov2fTbcIerjTGho_sXluzD1vw9uw',
    appId: '1:831823701566:ios:aba7fa03cb037cad22936f',
    messagingSenderId: '831823701566',
    projectId: 'somsomhouse-35f10',
    storageBucket: 'somsomhouse-35f10.appspot.com',
    iosClientId: '831823701566-kshneeptrnvbdkc4m5eb1h49968gmc9q.apps.googleusercontent.com',
    iosBundleId: 'com.example.somsomhouse',
  );
}
