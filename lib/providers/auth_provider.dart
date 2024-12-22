import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomAuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomAuthProvider() {
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    await _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // If user cancels

      // Obtain authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      await _auth.signInWithCredential(credential);

      // Successful sign-in, get user details
      _user = _auth.currentUser;
      print('Logged in as: ${_user?.displayName}');
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        print("Invalid Credential: ${e.message}");
      } else if (e.code == 'user-not-found') {
        print("User not found: ${e.message}");
      } else if (e.code == 'wrong-password') {
        print("Wrong password: ${e.message}");
      }
    } catch (e) {
      print("Error signing in with email and password: $e");
    }
  }
}
