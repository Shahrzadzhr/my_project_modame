import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/features/authentication/presentation/login_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/register_screen.dart';
import 'package:my_project_modame/src/features/authentication/presentation/welcome_screen.dart';
import 'package:my_project_modame/src/features/profile/presentation/personal_account.dart';
import 'package:my_project_modame/src/features/styling/presentation/Haircolor_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/Hourglass_shape.dart';
import 'package:my_project_modame/src/features/styling/presentation/bodyshape_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/home_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/start_screen.dart';
import 'package:my_project_modame/src/features/styling/presentation/warm_spring.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const loginKey = ValueKey('loginScreen');
    const homeKey = ValueKey('homeScreen');
    return StreamBuilder<User?>(
      stream: context.read<AuthRepository>().authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        final initialRoute = user == null ? "/" : "/start";
        return MaterialApp(
          key: user == null ? loginKey : homeKey,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          routes: {
            '/': (context) => const WelcomeScreen(),
            '/signin': (context) => const LoginScreen(),
            '/login': (context) => const HomeScreen(),
            '/register': (context) => const RegisterScreen(),
            '/account': (context) => const PersonalAccount(),
            '/next': (context) => const StartScreen(),
            '/start': (context) => const HomeScreen(),
            '/bodyshape': (context) => const BodyShapeScreen(),
            '/haircolor': (context) => const HairColorScreen(),
            '/hourglass_shape': (context) => const HourglassShapeScreen(),
            '/warm_spring': (context) => const WarmSpringScreen(),
          },
          initialRoute: initialRoute,
        );
      },
    );
  }
}
