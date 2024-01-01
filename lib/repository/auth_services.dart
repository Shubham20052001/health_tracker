import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:health_tracker/model/user_model.dart';
import 'package:health_tracker/utils/utils.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  late final UserModel _curUser;

  UserModel get curUser => _curUser;

  setUser(String uid, String username, String email) {
    _curUser = UserModel(uid, username, email);
  }

  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) return null;

    return UserModel(user.uid, user.displayName, user.email);
  }

  Stream<UserModel?> get userStream {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final auth.UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showMessage('No user found for that email.', context);
      } else if (e.code == 'wrong-password') {
        Utils.showMessage('Wrong password provided for that user.', context);
      }
    }
    return null;
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    try {
      final auth.UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      var user = _userFromFirebase(credential.user);
      setUser(user!.uid, username, user.email!);
      return user;
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showMessage('The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        Utils.showMessage(
            'The account already exists for that email.', context);
      }
    } catch (e) {
      Utils.showMessage("Error occured while registering user.", context);
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
