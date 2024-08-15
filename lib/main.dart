import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timi_fix/screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timi_fix/screens/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAKES2qkGUWnH5S2_tlKTky8b6QqKxRHMc",
          authDomain: "timifix-c20c9.firebaseapp.com",
          projectId: "timifix-c20c9",
          storageBucket: "timifix-c20c9.appspot.com",
          messagingSenderId: "600102961641",
          appId: "1:600102961641:web:be97b48d1255ce9d900b78",
          measurementId: "G-SDK5Q1R4BG"),
    );
  }
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: const LoginPage(),
    );
  }
}
