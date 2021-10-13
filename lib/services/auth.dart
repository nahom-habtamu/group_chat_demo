import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    }
    catch(e){
      print(e.toString());
    }
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<UserCredential?> signInUsers (String email, String password) async {
    try {
      var signedInUser = await _auth.signInWithEmailAndPassword(email: "nahom@gmail.com", password: "123456");
      return signedInUser;
    }
    catch(e){
      print("Error" + e.toString());
    }
  }

  Future<UserCredential?> registerUsers (String email, String password) async {
    try {
      var registeredUser = await _auth.createUserWithEmailAndPassword(email: "nahom@gmail.com", password: "123456");
      return registeredUser;
    }
    catch(e){
      print("Error" + e.toString());
    }
  }
}
