import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';

class RegisterScreen extends StatelessWidget {
// Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
// Konstruktor
  const RegisterScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
                blurRadius: 12,
                offset: Offset(0, 4),
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
                fontWeight: FontWeight.w500,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 433,
        left: 22,
        right: 22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 536,
        left: 21,
        right: 21,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'E-mail address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 637,
        left: 22,
        right: 22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.visibility),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 39,
        left: 108,
        right: 108,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/account');
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
            ),
          ],
        ),
      )
    ]));
  }
}
