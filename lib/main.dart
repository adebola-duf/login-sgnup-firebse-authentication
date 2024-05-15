import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page_desktop.dart';
import 'package:myapp/pages/login_page_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.sizeOf(context).width;
    print(totalWidth);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:
          totalWidth < 980 ? const LoginPageMobile() : const LoginPageDesktop(),
    );
  }
}
