import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return registerScreenWidget(context);
  }

  Widget registerScreenWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(159, 234, 213, 205),
                  Color.fromARGB(204, 193, 94, 67),
                ],
              ),
            ),
          ),
          Positioned(
            top: 32,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xFFA63533),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Container(
              height: 173,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/register_pic.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(56),
                  bottomRight: Radius.circular(56),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFAD6F57),
                    blurRadius: 20,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 262,
            left: 25,
            right: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    color: Color(0xFF7B161A),
                    fontSize: 19,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 197, 130, 130),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 332,
            left: 22,
            right: 22,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildTextInput("  First name", false, firstnameController),
                  const SizedBox(height: 40),
                  buildTextInput("  Last name", false, lastnameController),
                  const SizedBox(height: 40),
                  buildTextInput("  E-mail adresse", false, emailController),
                  const SizedBox(height: 40),
                  buildPasswordInput("  Password", passwordController),
                  const SizedBox(height: 40),
                  buildRegisterButton(context, firstnameController,
                      lastnameController, emailController, passwordController),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextInput(
      String label, bool obscureText, TextEditingController controller) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.topLeft,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 112, 78, 78),
            fontSize: 15,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordInput(String label, TextEditingController controller) {
    bool obscureText = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 112, 78, 78),
                fontSize: 15,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRegisterButton(
      BuildContext context,
      TextEditingController controllerFirstname,
      TextEditingController controllerLastname,
      TextEditingController controllerMail,
      TextEditingController controllerPassword) {
    return GestureDetector(
      onTap: () {
        debugPrint(controllerMail.text);
        AuthRepository authRepository = context.read<AuthRepository>();
        try {
          authRepository.signUpWithEmailAndPassword(
              controllerFirstname.text,
              controllerLastname.text,
              controllerMail.text,
              controllerPassword.text);
          context.read<AuthRepository>().setNewlyRegistered(true);
          //Navigator.pushNamed(context, '/account');
        } catch (e) {
          debugPrint("$e");
        }
      },
      child: Container(
        width: 177,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFA63533),
          borderRadius: BorderRadius.circular(41.5),
        ),
        alignment: Alignment.center,
        child: const Text(
          'REGISTER',
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
}
