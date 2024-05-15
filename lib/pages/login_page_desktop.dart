import 'package:flutter/material.dart';
import 'package:myapp/widgets/login_page_content.dart';

class LoginPageDesktop extends StatelessWidget {
  const LoginPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: LoginPageContent()),
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
