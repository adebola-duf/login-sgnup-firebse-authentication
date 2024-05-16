import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebse_auth/constants/constants.dart';
import 'package:login_signup_firebse_auth/firebase_options.dart';
// import 'package:url_launcher/url_launcher.dart';
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
  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(Uri(path: 'https://www.google.com/'),
  //       webOnlyWindowName: '_self')) {
  //     print('could not launch url');
  //     throw Exception('Could not launch url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'You are logged in ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async =>
                          await FirebaseAuth.instance.signOut(),
                      child: const Text('Sign out'),
                    ),
                  ),
                ],
              ),
            );
          }
          return const LoginSignupPage(purpose: Purpose.forLogin);
        },
      ),
    );
  }
}
