import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/widgets/login_page_content.dart';
import 'package:myapp/widgets/signup_page_content.dart';

class LoginSignupPageMobile extends StatelessWidget {
  const LoginSignupPageMobile({
    super.key,
    required this.purpose,
  });

  final Purpose purpose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .87,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/fidelity-lady.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
          ),
          purpose == Purpose.forLogin
              ? const LoginPageContent()
              : const SignupPageContent(),
        ],
      ),
    );
  }
}