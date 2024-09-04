import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  @override
  Future<void> addUser(UserProfile user) async {
    await _firebaseFirestore
        .collection("Userprofile")
        .doc(user.id)
        .set(user.toJson());
  }

  @override
  Future<UserProfile?> getUser(String id) async {
    final snapshot =
        await _firebaseFirestore.collection("Userprofile").doc(id).get();
    final map = snapshot.data();
    debugPrint("$map");
    if (map == null) {
      return null;
    } else {
      return UserProfile.fromMap(map);
    }
  }

  @override
  Future<void> updateUser(UserProfile user) async {
    await _firebaseFirestore
        .collection("Userprofile")
        .doc(user.id)
        .update(user.toJson());
  }
}
