import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 393,
            height: 852,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color.fromARGB(102, 183, 80, 39),
                  Color.fromARGB(209, 255, 246, 242)
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              ),
            ),
          ),
          /*Positioned(
            top: 32,
            left: 8,
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: const Color.fromARGB(255, 111, 29, 27),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),*/
          Positioned(
            top: 92,
            left: 20,
            right: 20,
            child: Container(
              width: 354,
              height: 57,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Hair color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 136, 29, 29)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/haircolor');
                      }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Positioned(
            top: 166,
            left: 20,
            right: 20,
            child: Container(
              width: 354,
              height: 57,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Skin color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_right,
                        color: Color.fromARGB(255, 136, 29, 29)),
                    onPressed: () {
                      //Navigator.pushNamed(context, '/skincolor');
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Positioned(
            top: 239,
            left: 20,
            right: 20,
            child: Container(
              width: 354,
              height: 57,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Body shape',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_right,
                        color: Color.fromARGB(255, 136, 29, 29)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/bodyshape');
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Positioned(
            top: 313,
            left: 20,
            right: 20,
            child: Container(
              width: 354,
              height: 57,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Height',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_right,
                        color: Color.fromARGB(255, 136, 29, 29)),
                    onPressed: () {
                      //Navigator.pushNamed(context, '/height');
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 411,
            child: Container(
              width: 393,
              height: 441,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Homepic.jpg'),
                  opacity: 0.8,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    bottomLeft: Radius.circular(31),
                    bottomRight: Radius.circular(31),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xFF885139),
                    blurRadius: 13,
                    offset: Offset(0, -5),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 393,
              height: 79,
              decoration: const ShapeDecoration(
                color: Color(0x99C1826A),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/account');
                    },
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
