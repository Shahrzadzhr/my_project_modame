import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project_modame/firebase_options.dart';
import 'package:my_project_modame/src/app.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/data/firestore_database.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final databaseRepository = FirestoreDatabase(FirebaseFirestore.instance);
  final authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(MultiProvider(
    providers: [
      Provider<DatabaseRepository>(
        create: (_) => databaseRepository,
      ),
      Provider<AuthRepository>(
        create: (_) => authRepository,
      ),
    ],
    child: const App(),
  ));
}
