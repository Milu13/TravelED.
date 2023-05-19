import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC-hICVSFfdeKLQYSSmkvcOnGEvxzxBEtw",
            authDomain: "traveled-ded67.firebaseapp.com",
            projectId: "traveled-ded67",
            storageBucket: "traveled-ded67.appspot.com",
            messagingSenderId: "797043110244",
            appId: "1:797043110244:web:e667d3a095ef78f8064a71"));
  } else {
    await Firebase.initializeApp();
  }
}
