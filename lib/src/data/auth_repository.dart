import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // Attribute
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Konstruktor
  AuthRepository(this._firebaseAuth);

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String pw, String firstname, String lastname) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((UserCredential userCredential) {
      String uid = userCredential.user!.uid;
      return _firestore.collection('users').doc(uid).set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': pw,
      });
    });
  }

  Future<void> loginWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);
  }

  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
