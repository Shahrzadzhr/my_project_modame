import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class LoginScreen extends StatelessWidget {
 const LoginScreen({super.key});
 
  
  
 @override 
 Widget build (BuildContext context) {
   
   return MaterialApp(
    home: Scaffold(
    body: Stack(
    
      children: [
         SizedBox.expand(
          child: Image.asset
          (".idea/assets/backgroundimage.jpg",fit: BoxFit.cover)),
           Center(
             child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height:140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    image: DecorationImage(
                      image: AssetImage(".idea/assets/logo.png"),
                      fit: BoxFit.cover,
                    )
                  ),
                   
             
                ),
                  
                 Form(
                  child: Column(
                    children: [
                      TextFormField(decoration: InputDecoration(labelText: "Username,email or mobile number"),),
                      const SizedBox( height:32),
                      TextFormField(
                          decoration:  InputDecoration(
                            border : OutlineInputBorder(),
                            labelText: "Password",
                            suffixIcon: IconButton(onPressed:() {

                              // setState (() {
                              //   showPassword = !ShowPassword;
                             });
                            }, icon: Icon(Icons.visibility_off))
                          )),

                 ],
                   
                        )
                 ))
                ],),
           )

            // 
                  

                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          border : OutlineInputBorder(),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed:() {

                              
                   ])
                  ));
 
 }








}