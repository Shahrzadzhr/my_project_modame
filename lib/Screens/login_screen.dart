
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                child: Image.asset(".idea/assets/backgroundimage.jpg", fit: BoxFit.cover),
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
                    image: DecorationImage(
                      image: AssetImage(".idea/assets/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),


            // Positioned login form
            Positioned(
              top: 488,
              left: 35,
              right: 35,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Username, email or mobile number',
                          labelStyle: TextStyle(
                            color: Color(0xFF892625),
                            fontSize: 14,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    

                    SizedBox(height: 14),

                    Container(
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
                        obscureText: true, 
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xFF892625),
                            fontSize: 14,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                          ),

                          // visibility off icon 
                          suffixIcon: Icon(Icons.visibility_off),
                         
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Container(
                      width: 324,
                      height: 54,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFA63533),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.78),
                        ),
                      ),


                      alignment: Alignment.center,
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    
                    
                    SizedBox(height: 25),
                    
                    
                    const Text(
                    'Remember me',
                      style: TextStyle(
                         color: Colors.white,
                          fontSize: 15,
                       fontFamily: 'SF Pro',
                       fontWeight: FontWeight.w600,
                       
                     ),
                    ),


                       Container(
                       width: 178,
                      height: 1,
                      decoration: BoxDecoration(color: Colors.white),
                    ),


                       SizedBox(height: 3),

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
          ]),
        ),
      );
    
    
  }
}



