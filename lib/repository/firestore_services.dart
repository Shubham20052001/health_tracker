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

  Future<QuerySnapshot<Object?>> findUserByID({required String uid}) async {
    CollectionReference users = _firestore.collection("users");
    return await users.where("uid", isEqualTo: uid).get();
  }

  Future<dynamic> getUserInfo({
    required String fieldName,
    required String uid,
  }) async {
    QuerySnapshot<Object?> querySnap = await findUserByID(uid: uid);
    QueryDocumentSnapshot<Object?> doc = querySnap.docs[0];
    return doc.get(fieldName);
  }
}
