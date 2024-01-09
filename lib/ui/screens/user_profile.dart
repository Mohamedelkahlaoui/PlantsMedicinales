import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final User? user;

  UserProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: ${user?.displayName ?? 'No name'}',
            ),
            Text(
              'Email: ${user?.email ?? 'No email'}',
            ),
          ],
        ),
      ),
    );
  }
}
