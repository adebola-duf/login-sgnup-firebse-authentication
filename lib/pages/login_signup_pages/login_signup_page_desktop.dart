import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/widgets/login_page_content.dart';
import 'package:myapp/widgets/signup_page_content.dart';

class LoginSignupPageDesktop extends StatelessWidget {
  const LoginSignupPageDesktop({
    super.key,
    required this.purpose,
  });

  final Purpose purpose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: purpose == Purpose.forLogin
                ? const LoginPageContent()
                : const SignupPageContent(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/fidelity-lady.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
