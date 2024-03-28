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
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   return macos;
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
    apiKey: 'AIzaSyBrqkccy9b9aN7bgk8Rfd5sZWec5pBrhDo',
    appId: '1:1071593264588:web:21cc249052387e10703969',
    messagingSenderId: '1071593264588',
    projectId: 'e-commerce-4284b',
    authDomain: 'e-commerce-4284b.firebaseapp.com',
    storageBucket: 'e-commerce-4284b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaXKvAnlwGIi_Uyzh6c3oqMDY53xWdFBg',
    appId: '1:1071593264588:android:8cc9047f9553ef76703969',
    messagingSenderId: '1071593264588',
    projectId: 'e-commerce-4284b',
    storageBucket: 'e-commerce-4284b.appspot.com',
  );

//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyA-j2UvlMMEcQTopwqC3FjIBQNjMTn0VPE',
//     appId: '1:1071593264588:ios:0dee80da6750e1f9703969',
//     messagingSenderId: '1071593264588',
//     projectId: 'e-commerce-4284b',
//     storageBucket: 'e-commerce-4284b.appspot.com',
//     iosBundleId: 'com.example.shoe_ecommerce_app',
//   );

//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyA-j2UvlMMEcQTopwqC3FjIBQNjMTn0VPE',
//     appId: '1:1071593264588:ios:fb9642207ec38d83703969',
//     messagingSenderId: '1071593264588',
//     projectId: 'e-commerce-4284b',
//     storageBucket: 'e-commerce-4284b.appspot.com',
//     iosBundleId: 'com.example.shoe_ecommerce_app.RunnerTests',
//   );
}
