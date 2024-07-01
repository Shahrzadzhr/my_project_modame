import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // simulated database
  List<UserProfile> userprofiles = [
    UserProfile(
      id: '1',
      profilePicUrl:
          'https://ca.slack-edge.com/T044YC3MSLF-U0682748V1R-3d876dea5ee3-192',
      vorname: 'Shahrzad',
      nachname: 'Zahraei',
      birthdate: '25.03.1988',
      phonenumber: '+49 176 202 56596',
    ),
    UserProfile(
      id: '2',
      profilePicUrl:
          'https://ca.slack-edge.com/T044YC3MSLF-U05GXAU2DH6-75f1f34f2c6f-72',
      vorname: 'David',
      nachname: 'Sent',
      birthdate: '11.11.1995',
      phonenumber: '+49 151 301 35345',
    ),
  ];

  @override
  Future<UserProfile?> getUser(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    for (UserProfile currentUser in userprofiles) {
      if (currentUser.id == id) {
        // we have a match
        return currentUser;
      }
    }
    return null;
  }

  @override
  Future<void> addUser(UserProfile user) async {
    await Future.delayed(const Duration(seconds: 2));
    userprofiles.add(user);
  }
}
