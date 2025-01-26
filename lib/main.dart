import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timi_fix/providers/user_provider.dart';
import 'package:timi_fix/responsive/mobile_screen_layout.dart';
import 'package:timi_fix/responsive/responsive_layout.dart';
import 'package:timi_fix/responsive/web_screen_layout.dart';
import 'package:timi_fix/screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timi_fix/screens/home_page.dart';
import 'package:timi_fix/screens/login_page.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TimiFix',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 1),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginPage();
          },
        ),
      ),
    );
  }
}

