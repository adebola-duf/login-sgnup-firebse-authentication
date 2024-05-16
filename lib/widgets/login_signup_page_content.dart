import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:login_signup_firebse_auth/constants/constants.dart';
import 'package:login_signup_firebse_auth/pages/login_signup_page.dart';

class LoginSignupPageContent extends StatefulWidget {
  const LoginSignupPageContent({
    super.key,
    required this.purpose,
  });

  final Purpose purpose;

  @override
  State<LoginSignupPageContent> createState() => _LoginSignupPageContentState();
}

class _LoginSignupPageContentState extends State<LoginSignupPageContent> {
  void _showFlushBar({
    required String message,
    required Color color,
  }) {
    Flushbar().dismiss();
    Flushbar(
      message: message,
      duration: const Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(13),
    ).show(context);
  }

  bool _isAuthenticating = false;
  _goToLoginPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginSignupPage(purpose: Purpose.forLogin),
      ),
    );
  }

  _goToSignUpPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginSignupPage(purpose: Purpose.forSignup),
      ),
    );
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isAuthenticating = true;
    });

    _formKey.currentState!.save();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _enteredEmail!, password: _enteredPassword!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showFlushBar(
            message: 'No user found for that email', color: Colors.red);
      } else if (e.code == 'invalid-credential') {
        _showFlushBar(message: 'Wrong username or password', color: Colors.red);
      }
    } catch (e) {
      _showFlushBar(message: e.toString(), color: Colors.red);
    }
    setState(() {
      _isAuthenticating = false;
    });
  }

  String? _enteredEmail;
  String? _enteredPassword;
  final _formKey = GlobalKey<FormState>();

  void _signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isAuthenticating = true;
    });

    _formKey.currentState!.save();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _enteredEmail!,
        password: _enteredPassword!,
      );
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginSignupPage(
              purpose: Purpose.forLogin,
            ),
          ),
        );
      }
      _showFlushBar(
          message: 'Account created successfully', color: Colors.green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showFlushBar(
            message: 'The password provided is too weak', color: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        _showFlushBar(
            message: 'An account already exists for that email',
            color: Colors.red);
      }
    } catch (e) {
      _showFlushBar(message: e.toString(), color: Colors.red);
    }
    setState(() {
      _isAuthenticating = false;
    });
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldContainer(
                          child: TextFormField(
                            validator: (String? enteredEmail) {
                              if (enteredEmail == null ||
                                  !EmailValidator.validate(enteredEmail)) {
                                return 'Enter a valid email.';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _enteredEmail = newValue,
                            cursorColor: Colors.black,
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
                            validator: (enteredPassword) {
                              if (enteredPassword == null ||
                                  enteredPassword.length < 8) {
                                return 'Password must be at least 8 characters.';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _enteredPassword = newValue,
                            cursorColor: Colors.black,
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
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 28, 28),
                            ),
                            onPressed: () => _isAuthenticating
                                ? null
                                : widget.purpose == Purpose.forSignup
                                    ? _signUp()
                                    : _login(),
                            child: !_isAuthenticating
                                ? Text(
                                    'NEXT',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : LoadingAnimationWidget.discreteCircle(
                                    color: const Color.fromARGB(
                                        255, 201, 255, 203),
                                    secondRingColor: const Color.fromARGB(
                                        255, 114, 171, 115),
                                    thirdRingColor:
                                        const Color.fromARGB(255, 20, 133, 24),
                                    size: 30,
                                  ),
                          ),
                        ),
                      ],
                    )),
                const Gap(24),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16)),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.purpose == Purpose.forSignup
                            ? 'Sign Up '
                            : 'Login ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
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
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.purpose == Purpose.forSignup
                                      ? 'Sign Up with'
                                      : 'Login with',
                                ),
                                const TextSpan(
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
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.purpose == Purpose.forSignup
                                      ? 'Sign Up with'
                                      : 'Login with',
                                ),
                                const TextSpan(
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
                    onTap: () => widget.purpose == Purpose.forSignup
                        ? _goToLoginPage(context)
                        : _goToSignUpPage(context),
                    child: Text(
                      widget.purpose == Purpose.forSignup
                          ? 'Already have an account? Login'
                          : 'Don\'t have an account? Sign up',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                if (widget.purpose == Purpose.forLogin)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot password?',
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
      padding: const EdgeInsets.all(8),
      // height: 52,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(child: child),
    );
  }
}