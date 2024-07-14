import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // Attribute
  final FirebaseAuth _firebaseAuth;

  // Konstruktor
  AuthRepository(this._firebaseAuth);

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signUpWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pw);
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

  Future<void> registerWithEmailAndPasswordAndFirstnameAndLastname(
      String email, String pw, String firstname, String lastname) {
    return _firebaseAuth.register(
        email: email, password: pw, firstname: firstname, lastname: lastname);
  }
}
