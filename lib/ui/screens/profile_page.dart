import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantesmedicinales/constants.dart';
import 'package:plantesmedicinales/ui/screens/user_profile.dart';
import 'package:plantesmedicinales/ui/screens/widgets/profile_widget.dart';
import 'package:plantesmedicinales/ui/signin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      user?.displayName ?? 'No name',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                        height: 24,
                        child: Image.asset("assets/images/verified.png")),
                  ],
                ),
              ),
              Text(
                user?.email ?? 'No user logged in',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'My Profile',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserProfileScreen(user: user)),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () {
                        // Add your code here
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {
                        // Add your code here
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                      onTap: () {
                        // Add your code here
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                      onTap: () {
                        // Add your code here
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const SignIn(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
