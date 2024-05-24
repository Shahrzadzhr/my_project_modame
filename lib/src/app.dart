import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/data/mock_database.dart';
import 'package:my_project_modame/src/features/authentication/presentation/login_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/register_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/welcome_screen.dart';
import 'package:my_project_modame/src/features/profile/presentation/pesonal_account.dart';
import 'package:my_project_modame/src/features/styling/presentation/home_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/start_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Database einmal an der Wurzel erzeugt
    DatabaseRepository databaseRepository = MockDatabase();
    return MaterialApp(
      title: 'Navigation',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signin': (context) => LoginScreen(),
        '/login': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen(),
        '/account': (context) => PersonalAccount(
              databaseRepository: databaseRepository,
            ),
        '/next': (context) => const StartScreen(),
        '/start': (context) => const HomeScreen(),
      },
    );
  }
}
