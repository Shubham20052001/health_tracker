import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addUser({
    required String username,
    required String email,
    required String uid,
  }) {
    CollectionReference users = _firestore.collection('users');
    return users
        .add({
          "username": username,
          "email": email,
          "uid": uid,
        })
        .then((value) => debugPrint("User added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }
}
