import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCWoPb-p_05suIMj_Pqhq3_CAYQHzpAOvE",
            authDomain: "a-i-gen-project-zdn0qt.firebaseapp.com",
            projectId: "a-i-gen-project-zdn0qt",
            storageBucket: "a-i-gen-project-zdn0qt.appspot.com",
            messagingSenderId: "667351858880",
            appId: "1:667351858880:web:d55e072d30ddaa3ae03725",
            measurementId: "G-4S1RFDRYP8"));
  } else {
    await Firebase.initializeApp();
  }
}
