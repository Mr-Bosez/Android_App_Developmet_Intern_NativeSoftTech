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
    apiKey: 'AIzaSyCl9tiEHKhoQotNCUMJwl9Y5rG1EhxK1r0',
    appId: '1:189574534395:web:8fc87ce65818bb54648c5e',
    messagingSenderId: '189574534395',
    projectId: 'e-commerce-62f5a',
    authDomain: 'e-commerce-62f5a.firebaseapp.com',
    databaseURL: 'https://e-commerce-62f5a-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-62f5a.firebasestorage.app',
    measurementId: 'G-0N0QJJ8X96',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCbzEa9OWpBxYJcUG990WjtCwtYiry9yI',
    appId: '1:189574534395:android:0abcd90860790126648c5e',
    messagingSenderId: '189574534395',
    projectId: 'e-commerce-62f5a',
    databaseURL: 'https://e-commerce-62f5a-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-62f5a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVoBAlD-AfbvfyWjjVxtD4ZcIkE70a6XE',
    appId: '1:189574534395:ios:157588054ae48a3a648c5e',
    messagingSenderId: '189574534395',
    projectId: 'e-commerce-62f5a',
    databaseURL: 'https://e-commerce-62f5a-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-62f5a.firebasestorage.app',
    iosBundleId: 'com.ecommerce.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVoBAlD-AfbvfyWjjVxtD4ZcIkE70a6XE',
    appId: '1:189574534395:ios:157588054ae48a3a648c5e',
    messagingSenderId: '189574534395',
    projectId: 'e-commerce-62f5a',
    databaseURL: 'https://e-commerce-62f5a-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-62f5a.firebasestorage.app',
    iosBundleId: 'com.ecommerce.eCommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCl9tiEHKhoQotNCUMJwl9Y5rG1EhxK1r0',
    appId: '1:189574534395:web:b607938f2ba26cd9648c5e',
    messagingSenderId: '189574534395',
    projectId: 'e-commerce-62f5a',
    authDomain: 'e-commerce-62f5a.firebaseapp.com',
    databaseURL: 'https://e-commerce-62f5a-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-62f5a.firebasestorage.app',
    measurementId: 'G-1DZM3M0118',
  );
}
