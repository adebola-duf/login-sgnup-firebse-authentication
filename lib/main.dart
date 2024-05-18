import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebse_auth/constants/constants.dart';
import 'package:login_signup_firebse_auth/firebase_options.dart';
import 'package:login_signup_firebse_auth/pages/home_page.dart';
import 'package:login_signup_firebse_auth/pages/login_signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage(user: snapshot.data!);
          }
          return const LoginSignupPage(purpose: Purpose.forLogin);
        },
      ),
    );
  }
}
