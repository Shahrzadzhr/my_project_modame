import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/data/mock_database.dart';
import 'package:my_project_modame/src/features/authentication/presentation/login_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/register_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/welcome_screen.dart';
import 'package:my_project_modame/src/features/profile/presentation/pesonal_account.dart';
import 'package:my_project_modame/src/features/styling/presentation/home_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/start_screen.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const App(
      {super.key,
      required this.authRepository,
      required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();

    return MaterialApp(
      title: 'Navigation',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signin': (context) => LoginScreen(
              databaseRepository: databaseRepository,
              authRepository: authRepository,
            ),
        '/login': (context) => const HomeScreen(),
        '/register': (context) => RegisterScreen(
              databaseRepository: databaseRepository,
              authRepository: authRepository,
            ),
        '/account': (context) => PersonalAccount(
              databaseRepository: databaseRepository,
              authRepository: authRepository,
            ),
        '/next': (context) => const StartScreen(),
        '/start': (context) => const HomeScreen(),
      },
    );
  }
}
