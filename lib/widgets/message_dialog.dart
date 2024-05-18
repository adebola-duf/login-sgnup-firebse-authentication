import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:login_signup_firebse_auth/constants/constants.dart';
import 'package:login_signup_firebse_auth/pages/login_signup_page.dart';
import 'package:lottie/lottie.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: Container(
        width: 400,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              color: Colors.green,
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/check-mark-animation.json',
                    height: 70,
                  ),
                  const Text(
                    'Awesome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Your account has been created',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Gap(15),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginSignupPage(
                        purpose: Purpose.forLogin,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Take me to login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    const Color errorColor = Color.fromARGB(255, 222, 99, 27);

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: Container(
        width: 400,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              color: errorColor,
              child: Column(
                children: [
                  const Gap(20),
                  Lottie.asset(
                    'assets/animations/error-animation.json',
                    height: 70,
                  ),
                  const Gap(20),
                ],
              ),
            ),
            Container(
              // height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const Gap(10),
                  const Text(
                    'Oh snap!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(15),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.close,
                            color: errorColor,
                          ),
                          Text(
                            'Close',
                            style: TextStyle(color: errorColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
