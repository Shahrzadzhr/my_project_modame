import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _rememberMe = ValueNotifier(false);
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loginScreenWidget(context);
  }

  Widget _loginScreenWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              onPressed: () => Navigator.pop(context),
            ),
          ),
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
                  _buildTextInput(
                      "  Username, email or mobile number", _emailController),
                  const SizedBox(height: 14),
                  _buildPasswordInput("  Password", _passwordController),
                  const SizedBox(height: 20),
                  _buildLoginButton(context),
                  const SizedBox(height: 8),
                  _buildRememberMe(),
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
                      fontWeight: FontWeight.bold,
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

  Widget _buildTextInput(String label, TextEditingController controller) {
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
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xFF892625),
            fontSize: 14,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput(String label, TextEditingController controller) {
    return Container(
      width: 322,
      height: 71,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xFF892625),
            fontSize: 14,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AuthRepository>(context, listen: false)
            .loginWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
        Navigator.pushNamed(context, '/home');
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
      ),
    );
  }

  Widget _buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: _rememberMe,
          builder: (_, value, __) => Checkbox(
            value: value,
            onChanged: (newValue) {
              _rememberMe.value = newValue ?? false;
            },
            checkColor: const Color.fromARGB(255, 161, 29, 29),
            activeColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
