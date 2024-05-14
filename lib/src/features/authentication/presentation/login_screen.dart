import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<bool> _rememberMe = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background image with opacity
            SizedBox.expand(
              child: Opacity(
                opacity: 0.9,
                child: Image.asset("assets/backgroundimage.jpg",
                    fit: BoxFit.cover),
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
                    buildTextInput(
                        "   Username, email or mobile number", false),
                    SizedBox(height: 14),
                    buildTextInput("   Password", true),
                    SizedBox(height: 20),
                    buildLoginButton(),
                    SizedBox(height: 8),
                    buildRememberMe(),
                    Container(
                      width: 178,
                      height: 1,
                      decoration: BoxDecoration(color: Colors.white),
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
      ),
    );
  }

  Widget buildTextInput(String label, bool obscureText) {
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
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(
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

  Widget buildLoginButton() {
    return Container(
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
    );
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
              checkColor:
                  Color.fromARGB(255, 161, 29, 29), // color of tick Mark
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
