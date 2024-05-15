import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants/constants.dart';
import 'package:myapp/pages/login_signup_pages/login_signup_page.dart';

class SignupPageContent extends StatelessWidget {
  const SignupPageContent({super.key});

  _goToLoginPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginSignupPage(purpose: Purpose.forLogin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 520,
            ),
            child: Column(
              children: [
                Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.smoochSans(
                    textStyle: const TextStyle(
                      height: .7,
                      fontSize: 110,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(10),
                Text(
                  'We are glad you\'re here',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(29),
                TextFieldContainer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                      prefixIcon: const Icon(Icons.email),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Gap(24),
                TextFieldContainer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Gap(24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 28, 28, 28),
                    ),
                    onPressed: () {},
                    child: Text(
                      'NEXT',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(24),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16)),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Sign Up ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'with others',
                      ),
                    ],
                  ),
                ),
                const Gap(24),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/google-logo.svg',
                            height: 30,
                          ),
                          const Gap(6),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 12)),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Sign Up with',
                                ),
                                TextSpan(
                                  text: ' Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/microsoft-logo.svg',
                            height: 30,
                          ),
                          const Gap(6),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 12)),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Sign Up with',
                                ),
                                TextSpan(
                                  text: ' Microsoft',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(18),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _goToLoginPage(context),
                    child: const Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(child: child),
    );
  }
}
