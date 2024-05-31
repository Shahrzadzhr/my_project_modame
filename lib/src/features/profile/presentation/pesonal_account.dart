import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/database_repository.dart';

class PersonalAccount extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const PersonalAccount({super.key, required this.databaseRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    // get currently logged in user from database
    final loggedInUser = databaseRepository.getUser("1");

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color.fromARGB(206, 160, 49, 47),
                  Color.fromARGB(79, 229, 174, 152),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(31)),
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
            top: 62,
            left: 150,
            right: 150,
            child: Container(
              width: 93,
              height: 89,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(loggedInUser.profilePicUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(43.54),
                border: Border.all(width: 1, color: const Color(0xFF7B161A)),
              ),
            ),
          ),
          Positioned(
            top: 162,
            left: 100,
            right: 100,
            child: Container(
              width: 150,
              height: 1,
              color: const Color(0xFFECAAA5),
            ),
          ),
          Positioned(
            top: 165,
            left: 16,
            right: 16,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                loggedInUser.getFullName,
                style: const TextStyle(
                  color: Color(0xFF500004),
                  fontSize: 13,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 213,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Phone number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loggedInUser.phonenumber,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 13,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: Color.fromARGB(255, 136, 29, 29)),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 323,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Birth date',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loggedInUser.birthdate,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 79, 79, 79)
                              .withOpacity(0.7),
                          fontSize: 13,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right,
                            color: Color.fromARGB(255, 136, 29, 29)),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 429,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Preferred content',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '   Women',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 13,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right,
                            color: Color.fromARGB(255, 136, 29, 29)),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 244,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/next');
              },
              child: Container(
                width: 373,
                height: 55,
                decoration: ShapeDecoration(
                  color: const Color(0xFFA63533),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(41),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 169,
            left: 10,
            right: 10,
            child: Container(
              width: 373,
              height: 55,
              decoration: ShapeDecoration(
                color: const Color(0xFFAD6F57),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(41),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'LOG OUT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 142,
            left: 27,
            right: 27,
            child: Container(
              width: 339,
              height: 2,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 191, 146, 127)),
            ),
          ),
          const Positioned(
            bottom: 116,
            left: 64,
            right: 228,
            child: Text(
              'Delete profile',
              style: TextStyle(
                color: Color(0xFF7A2917),
                fontSize: 14,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: 102,
            left: 28,
            right: 343,
            child: IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 130, 25, 17)),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 101,
            left: 27,
            right: 27,
            child: Container(
              width: 339,
              height: 2,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 191, 146, 127)),
            ),
          ),
          Positioned(
            top: 773,
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
