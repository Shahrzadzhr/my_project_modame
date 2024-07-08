import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  @override
  Future<void> addUser(UserProfile user) async {
    await _firebaseFirestore
        .collection("users")
        .doc(user.id)
        .set(user.toJson());
  }

  @override
  Future<UserProfile?> getUser(String id) async {
    DocumentSnapshot doc =
        await _firebaseFirestore.collection("users").doc(id).get();
    if (doc.exists) {
      return UserProfile.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
