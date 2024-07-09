import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/data/mock_database.dart';
import 'package:my_project_modame/src/features/authentication/presentation/login_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/register_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/welcome_screen.dart';
import 'package:my_project_modame/src/features/profile/presentation/personal_account.dart';
import 'package:my_project_modame/src/features/styling/presentation/home_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/start_screen.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const App({
    super.key,
    required this.authRepository,
    required this.databaseRepository,
  });

  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();

    const loginKey = ValueKey('loginScreen');
    const homeKey = ValueKey('homeScreen');
    return StreamBuilder<User?>(
      stream: authRepository.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        final initialRoute = user == null ? "/" : "/start";
        return MaterialApp(
          key: user == null ? loginKey : homeKey,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          routes: {
            '/': (context) => WelcomeScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
            '/signin': (context) => LoginScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
            '/login': (context) => HomeScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
            '/register': (context) => RegisterScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
            '/account': (context) => PersonalAccount(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
            '/next': (context) => const StartScreen(),
            '/start': (context) => HomeScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                ),
          },
          initialRoute: initialRoute,
        );
      },
    );
  }
}
