import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project_modame/firebase_options.dart';
import 'package:my_project_modame/src/app.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/data/firestore_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DatabaseRepository firestoreDatabase =
      FirestoreDatabase(FirebaseFirestore.instance);
  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(App(
    databaseRepository: firestoreDatabase,
    authRepository: authRepository,
  ));
}
