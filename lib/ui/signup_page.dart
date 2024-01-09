import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantesmedicinales/constants.dart';
import 'package:plantesmedicinales/ui/screens/widgets/custom_textfield.dart';
import 'package:plantesmedicinales/ui/signin_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailText = TextEditingController();
  TextEditingController _passwordText = TextEditingController();
  TextEditingController _fullNameText = TextEditingController();
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
                  'assets/images/signup.png',
                  width:
                      size.width * 0.5, // set width to 50% of the screen width
                  height: size.height *
                      0.3, // set height to 30% of the screen height
                ),
              ),
              const Text(
                'Sign Up',
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
                controller: _fullNameText,
                obscureText: false,
                hintText: 'Enter Full name',
                icon: Icons.person,
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
                  if (_emailText.text.isEmpty ||
                      _passwordText.text.isEmpty ||
                      _fullNameText.text.isEmpty) {
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

                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_emailText.text)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Enter a valid email address.'),
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
                  if (_passwordText.text.length < 6) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content:
                              Text('Password should be at least 6 characters.'),
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
                    final UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _emailText.text,
                      password: _passwordText.text,
                    );
                    if (user != null) {
                      await user.user!.updateDisplayName(_fullNameText.text);

                      // Show a SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('User has been created successfully.'),
                        ),
                      );

                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    }
                  } catch (e) {
                    if (e is FirebaseAuthException &&
                        e.code == 'email-already-in-use') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'The email address is already in use by another User.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Handle other errors
                      print(e);
                    }
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
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
