//Firebase user management 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';

class FireBaselog {
  // For registering a new user
  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      // ignore: deprecated_member_use
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        snackbar(context, "The password provided is too weak", 500);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        snackbar(context, "The account already exists for that email", 500);
      }
      else if (e.code == 'email-already-in-use')
      {
        print('This email already in use');
        snackbar(context, "This Email Id already in use", 500);
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  // For signing in an user (have already registered)
  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackbar(context, "No user found for that email", 500);
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        snackbar(context, "Wrong password", 500);
      }
    }
    return user;
  }


//Refreshing user info
  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
