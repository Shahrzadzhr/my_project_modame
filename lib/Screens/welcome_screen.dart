import 'package:flutter/material.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 393,
            height: 852,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color.fromARGB(159, 234, 213, 205), Color.fromARGB(204, 193, 94, 67)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              ),
            ),
          ),
          Container(
            width: 393,
            height: 251,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.6),
                  spreadRadius: 7,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('.idea/assets/welcome pic.jpg'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          Positioned(
            top: 305,
            right: 228,
            left: 19,
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
          Positioned(
            top: 426,
            right: 11,
            left: 11,
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
                      color: Color(0xFF7B161A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
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
                SizedBox(height: 17),
                Container(
                  width: 371,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 157, 95, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 97),
                Text(
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
                  child: IconButton(
                    constraints: BoxConstraints(maxHeight: 60),
                    onPressed: () {},
                    icon: Image.asset('.idea/assets/google logo.png'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}