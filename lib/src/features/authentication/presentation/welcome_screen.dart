import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [
                Color.fromARGB(159, 234, 213, 205),
                Color.fromARGB(204, 193, 94, 67)
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
          ),
        ),

        Container(
          width: double.infinity,
          height: 251,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.6),
                spreadRadius: 7,
                blurRadius: 30,
                offset: const Offset(0, 5),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/welcome_pic.jpg'),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(60),
            ),
          ),
        ),

        const Positioned(
          top: 305,
          left: 19,
          right: 228,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 146,
                  height: 25,
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                      color: Color(0xFF7B161A),
                      fontSize: 29,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nice to have you here',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        //
        Positioned(
          top: 426,
          left: 11,
          right: 11,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  width: 371,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF7B161A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Container(
                  width: 371,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 157, 95, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 97),
              const Text(
                'Sign in with your social account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  height: 3,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(maxHeight: 50),
                      onPressed: () {},
                      icon: Image.asset('assets/google_logo.png'),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(maxHeight: 50),
                      onPressed: () {},
                      icon: Image.asset('assets/apple_logo.png'),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(maxHeight: 50),
                      onPressed: () {},
                      icon: Image.asset('assets/facebook_logo.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
