import 'package:flutter/material.dart';
import 'package:login_signup_firebse_auth/constants/constants.dart';
import 'package:login_signup_firebse_auth/pages/login_signup_page_desktop.dart';
import 'package:login_signup_firebse_auth/pages/login_signup_page_mobile.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({
    super.key,
    required this.purpose,
  });

  final Purpose purpose;

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.sizeOf(context).width;

    return totalWidth < desktopWidth
        ? LoginSignupPageMobile(
            purpose: purpose,
          )
        : LoginSignupPageDesktop(
            purpose: purpose,
          );
  }
}