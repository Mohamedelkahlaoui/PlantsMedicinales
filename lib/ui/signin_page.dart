import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantesmedicinales/constants.dart';
import 'package:plantesmedicinales/ui/forgot_password.dart';
import 'package:plantesmedicinales/ui/onboarding_screen.dart';
import 'package:plantesmedicinales/ui/root_page.dart';
import 'package:plantesmedicinales/ui/screens/widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailText = TextEditingController();
  TextEditingController _passwordText = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/signin.png',
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                controller: _emailText,
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
              ),
              CustomTextfield(
                controller: _passwordText,
                obscureText: true,
                hintText: 'Enter Password',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  if (_emailText.text.isEmpty || _passwordText.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('All fields are required.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  try {
                    final UserCredential user =
                        await _auth.signInWithEmailAndPassword(
                      email: _emailText.text,
                      password: _passwordText.text,
                    );
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: const RootPage(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    }
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'Failed to sign in. Please check your credentials.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Forgot Password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Reset Here',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const OnboardingScreen(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'New to Planty? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
