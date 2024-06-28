import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';

class LoginScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const LoginScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _rememberMe = ValueNotifier(false);
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginScreen = LoginScreen(
        databaseRepository: widget.databaseRepository,
        authRepository: widget.authRepository);
    final overviewScreen = OverviewScreen(
        databaseRepository: widget.databaseRepository,
        authRepository: widget.authRepository);
    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('overviewScreen');

    return StreamBuilder<User?>(
      stream: widget.authRepository.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        return MaterialApp(
          key: user == null ? loginKey : overviewKey,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          home: user == null ? loginScreenWidget(context) : overviewScreen,
        );
      },
    );
  }

  Widget loginScreenWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity
          SizedBox.expand(
            child: Opacity(
              opacity: 0.9,
              child:
                  Image.asset("assets/backgroundimage.jpg", fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 32,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Positioned logo
          Positioned(
            top: -10,
            right: 0,
            left: 0,
            bottom: 400,
            child: Center(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 488,
            left: 35,
            right: 35,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildTextInput("   Username, email or mobile number", false,
                      emailController),
                  const SizedBox(height: 14),
                  buildTextInput("   Password", true, passwordController),
                  const SizedBox(height: 20),
                  buildLoginButton(context, widget.authRepository,
                      emailController, passwordController),
                  const SizedBox(height: 8),
                  buildRememberMe(),
                  Container(
                    width: 178,
                    height: 1,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextInput(
      String label, bool obscureText, TextEditingController controller) {
    return Container(
      width: 322,
      height: 71,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      alignment: Alignment.topLeft,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xFF892625),
            fontSize: 14,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: obscureText ? const Icon(Icons.visibility_off) : null,
        ),
      ),
    );
  }

  Widget buildLoginButton(
      BuildContext context,
      AuthRepository authRepository,
      TextEditingController controllerMail,
      TextEditingController controllerPassword) {
    return GestureDetector(
        onTap: () {
          authRepository.loginWithEmailAndPassword(
              controllerMail.text, controllerPassword.text);
          Navigator.pushNamed(context, '/login');
        },
        child: Container(
          width: 324,
          height: 54,
          decoration: ShapeDecoration(
            color: const Color(0xFFA63533),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26.78),
            ),
          ),
          alignment: Alignment.center,
          child: const Text(
            'LOG IN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }

  Widget buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: _rememberMe,
          builder: (_, value, __) {
            return Checkbox(
              value: value,
              onChanged: (newValue) {
                _rememberMe.value = newValue ?? false;
              },
              checkColor: const Color.fromARGB(255, 161, 29, 29),
              activeColor: const Color.fromARGB(255, 255, 255, 255),
            );
          },
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class OverviewScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const OverviewScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: const Center(
        child: Text('Welcome to the overview screen'),
      ),
    );
  }
}
