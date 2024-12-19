import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> signOut() async {
      if (_auth.currentUser != null) {
        await _auth.signOut();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    }

    return Center(
      child: InkWell(
        onTap: signOut,
        child: Text('Sign out'),
      ),
    );
  }
}
