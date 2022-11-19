import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String pwd,
    required String username,
    required String bio,
    // required Uint8List file,
  }) async {
    String res = "Some Error Occurs";
    try {
      if (email.isNotEmpty ||
          pwd.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: pwd);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });

        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });

        res = 'success';
        print(cred.user!.uid);
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
