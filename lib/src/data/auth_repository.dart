import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

class AuthRepository {
  // Attribute
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _newlyRegistered = false;

  // Konstruktor
  AuthRepository(this._firebaseAuth);

  void setNewlyRegistered(bool value) {
    _newlyRegistered = value;
  }

  bool isNewlyRegistered() {
    return _newlyRegistered;
  }

  User? getCurrentUser() {
    // Hier wurde die Bedingung und Logik korrigiert
    return _firebaseAuth.currentUser;
  }

  Future<void> signUpWithEmailAndPassword(
      String firstName, String lastName, String email, String pw) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((UserCredential userCredential) {
      String uid = userCredential.user!.uid;
      UserProfile user = UserProfile(
          id: uid,
          email: email,
          profilePicUrl: "",
          firstName: firstName,
          lastName: lastName,
          birthdate: "",
          phoneNumber: "");
      _firestore.collection("Userprofile").doc(uid).set(user.toJson());
      return _firestore.collection('Users').doc(uid).set({
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
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
