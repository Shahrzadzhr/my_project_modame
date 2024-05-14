import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              ),
              gradient: const LinearGradient(
                begin: Alignment(-0.01, -1),
                end: Alignment(0.01, 1.00),
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
              color: const Color.fromARGB(255, 111, 29, 27),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 50,
            left: 8.06,
            right: 0.17,
            child: Container(
              width: 209.58,
              height: 391.44,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(142.50),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/She&He.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 490,
            left: 5,
            right: 5,
            child: SizedBox(
              width: 100,
              child: Text(
                'Create your style profile and receive personalized recommendations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 108, 67, 51),
                  fontSize: 22,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(255, 129, 68, 44)
                          .withOpacity(0.5),
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 158,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/start');
              },
              child: Container(
                width: 352,
                height: 70,
                decoration: ShapeDecoration(
                  color: const Color(0xFF7B161A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'START',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 393,
              height: 79,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(153, 139, 87, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(31),
                    bottomRight: Radius.circular(31),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home,
                        color: Color.fromARGB(255, 130, 25, 17)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.visibility,
                        color: Color.fromARGB(255, 130, 25, 17)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.search,
                        color: Color.fromARGB(255, 130, 25, 17)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite,
                        color: Color.fromARGB(255, 130, 25, 17)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.person,
                        color: Color.fromARGB(255, 130, 25, 17)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
