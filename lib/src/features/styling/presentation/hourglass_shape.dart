import 'package:flutter/material.dart';

class HourglassShapeScreen extends StatefulWidget {
  const HourglassShapeScreen({
    super.key,
  });

  @override
  State<HourglassShapeScreen> createState() => _HourglassShapeScreenState();
}

class _HourglassShapeScreenState extends State<HourglassShapeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 393,
            height: 852,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xBFA63533), Color(0xA3E6B39E)],
              ),
              borderRadius: BorderRadius.circular(31),
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
          const Positioned(
            top: 75,
            left: 42,
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'You have a ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'HOURGLASS',
                      style: TextStyle(
                        color: Color.fromARGB(255, 91, 7, 10),
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' body shape if you have:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const Positioned(
            top: 110,
            left: 42,
            right: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletListItem(text: 'Full bust'),
                BulletListItem(text: 'Well defined narrow waist'),
                BulletListItem(
                    text: 'Proportionately balanced shoulder and hips'),
                BulletListItem(text: 'Rounded bottom'),
                BulletListItem(text: 'Curvy body'),
                BulletListItem(text: 'The ratio of bust: waist: hips is 4:2:4'),
              ],
            ),
          ),
          const Positioned(
            top: 250,
            left: 42,
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your styling ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'GOALS:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 91, 7, 10),
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const Positioned(
            top: 284,
            left: 42,
            right: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletListItem(text: 'Highlight your natural curves'),
                BulletListItem(
                    text:
                        'Proportionally balance both upper and\nlower body at the same time'),
                BulletListItem(text: 'Flaunt your well-defined waist'),
              ],
            ),
          ),
          Positioned(
            bottom: 480,
            left: 30,
            right: 30,
            child: Container(
              height: 2,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 111, 29, 27)),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 70,
            child: Center(
              child: Container(
                width: 250,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/HourglassR.png'),
                    opacity: 0.9,
                    fit: BoxFit.fill,
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
              decoration: const BoxDecoration(
                color: Color(0xFFD6A997),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(31),
                  bottomRight: Radius.circular(31),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home,
                        color: Color.fromARGB(255, 130, 25, 17)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
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

class BulletListItem extends StatelessWidget {
  final String text;

  const BulletListItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 13)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
