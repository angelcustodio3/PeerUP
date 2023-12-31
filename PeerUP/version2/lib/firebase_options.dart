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
    apiKey: 'AIzaSyDMRPK8h00oW4v_2GRtZDsEwrbow5X8JCU',
    appId: '1:338444043040:web:0d5377e2a43b8cfd064d45',
    messagingSenderId: '338444043040',
    projectId: 'peerup-e481f',
    authDomain: 'peerup-e481f.firebaseapp.com',
    storageBucket: 'peerup-e481f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSUBTeTcXUj7k6r563o4o7MetEHD6FQ5o',
    appId: '1:338444043040:android:ca2c00af0158bafc064d45',
    messagingSenderId: '338444043040',
    projectId: 'peerup-e481f',
    storageBucket: 'peerup-e481f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtShFI19o13A_xsWAgzT4RsCwo_2YpTtE',
    appId: '1:338444043040:ios:5122eb6e0340302a064d45',
    messagingSenderId: '338444043040',
    projectId: 'peerup-e481f',
    storageBucket: 'peerup-e481f.appspot.com',
    iosBundleId: 'com.example.peer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtShFI19o13A_xsWAgzT4RsCwo_2YpTtE',
    appId: '1:338444043040:ios:a1433fcc28ee9b1e064d45',
    messagingSenderId: '338444043040',
    projectId: 'peerup-e481f',
    storageBucket: 'peerup-e481f.appspot.com',
    iosBundleId: 'com.example.peer.RunnerTests',
  );
}
