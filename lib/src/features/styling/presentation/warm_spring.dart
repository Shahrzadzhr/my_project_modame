import 'package:flutter/material.dart';

class WarmSpringScreen extends StatefulWidget {
  const WarmSpringScreen({
    super.key,
  });

  @override
  State<WarmSpringScreen> createState() => _WarmSpringScreen();
}

class _WarmSpringScreen extends State<WarmSpringScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: 393,
        height: 852,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xBFA63533), Color(0x5EE6B39E)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
        ),
      ),
      Positioned(
        top: 32,
        left: 8,
        child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color.fromARGB(255, 111, 29, 27),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    ]));
  }
}
