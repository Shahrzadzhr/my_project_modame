import 'package:flutter/material.dart';

import 'package:my_project_modame/Screens/login_screen.dart';  // Importiere die LoginScreen-Datei
import 'package:my_project_modame/Screens/welcome_screen.dart';  // Importiere die WelcomeScreen-Datei


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
