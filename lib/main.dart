import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/pages/login_signup_pages/login_signup_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginSignupPage(purpose: Purpose.forLogin),
    );
  }
}
