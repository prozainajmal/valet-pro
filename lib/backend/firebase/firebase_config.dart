import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA-Xe-XMKtGT7gCfaIr6oYNnkj5lifLuuk",
            authDomain: "c-r-m-responsive-app-ysv0m2.firebaseapp.com",
            projectId: "c-r-m-responsive-app-ysv0m2",
            storageBucket: "c-r-m-responsive-app-ysv0m2.firebasestorage.app",
            messagingSenderId: "472035298713",
            appId: "1:472035298713:web:b3da8899aa309564e49708"));
  } else {
    await Firebase.initializeApp();
  }
}
