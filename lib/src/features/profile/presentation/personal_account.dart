import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project_modame/src/data/auth_repository.dart';
import 'package:my_project_modame/src/data/database_repository.dart';
import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';
import 'package:provider/provider.dart';

class PersonalAccount extends StatefulWidget {
  const PersonalAccount({super.key});

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount> {
  late TextEditingController phonenumberController;
  late TextEditingController birthdateController;
  String selectedGender = 'Men';

  @override
  void initState() {
    debugPrint("accountscreen");
    phonenumberController = TextEditingController();
    birthdateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phonenumberController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return accountScreenWidget(context);
  }

  Future<UserProfile?> getUserFuture(BuildContext context) async {
    try {
      User? user = context.read<AuthRepository>().getCurrentUser();
      if (user != null) {
        return await context.read<DatabaseRepository>().getUser(user.uid);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }

  Widget accountScreenWidget(BuildContext context) {
    //final User? user = context.read<AuthRepository>().getCurrentUser();

    return Scaffold(
      body: FutureBuilder<UserProfile?>(
        future: getUserFuture(context),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data!;
            return Stack(
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
                    onPressed: () => Navigator.maybePop(context),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 150,
                  right: 150,
                  child: Container(
                    width: 93,
                    height: 89,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data.profilePicUrl == ""
                            ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
                            : data.profilePicUrl),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(43.54),
                      border:
                          Border.all(width: 1, color: const Color(0xFF7B161A)),
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 100,
                  right: 100,
                  child: Container(
                    width: 150,
                    height: 1,
                    color: const Color(0xFFECAAA5),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 16,
                  right: 16,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      data.getFullName(),
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
                  top: 250,
                  left: 24,
                  right: 24,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTextInputWithIcon("Phone number", false,
                            phonenumberController, Icons.edit),
                        const SizedBox(height: 40),
                        buildTextInputWithIcon("Birthdate", false,
                            birthdateController, Icons.keyboard_arrow_right),
                        const SizedBox(height: 40),
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 13,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedGender,
                                icon: const Icon(Icons.keyboard_arrow_right,
                                    color: Color.fromARGB(255, 136, 29, 29)),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGender = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Women',
                                  'Men'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 244,
                  left: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      data.birthdate = birthdateController.text;
                      data.phoneNumber = phonenumberController.text;
                      context.read<DatabaseRepository>().updateUser(data);
                      context.read<AuthRepository>().setNewlyRegistered(false);
                      Navigator.pushNamed(context, '/start');
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
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthRepository>().logout();
                      Navigator.pushNamed(context, '/welcome');
                    },
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
                ),
                Positioned(
                  bottom: 142,
                  left: 27,
                  right: 27,
                  child: Container(
                    width: 339,
                    height: 2,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 191, 146, 127),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 23,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Color.fromARGB(255, 136, 29, 29)),
                        onPressed: () {},
                      ),
                      const Text(
                        'Delete profile',
                        style: TextStyle(
                          color: Color(0xFF7A2917),
                          fontSize: 14,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                      color: Color.fromARGB(255, 191, 146, 127),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 393,
                    height: 79,
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(153, 188, 117, 89),
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
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Icon(Icons.error),
            );
          }
        },
      ),
    );
  }
}

Widget buildTextInputWithIcon(
  String label,
  bool obscureText,
  TextEditingController controller,
  IconData icon,
) {
  // Create a FocusNode to control the focus of the TextFormField
  final FocusNode focusNode = FocusNode();

  return Container(
    height: 56,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.75),
      borderRadius: BorderRadius.circular(20),
    ),
    alignment: Alignment.topLeft,
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode, // Attach the FocusNode to the TextFormField
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: IconButton(
          icon: Icon(icon, color: const Color.fromARGB(255, 136, 29, 29)),
          onPressed: () {
            // Request focus for the TextFormField when the button is pressed
            focusNode.requestFocus();
          },
        ),
      ),
    ),
  );
}
