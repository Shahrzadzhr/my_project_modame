import 'package:my_project_modame/src/features/profile/domain/UserProfile.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // simulated database
  List<UserProfile> userprofiles = [
    UserProfile(
      "1",
      "https://ca.slack-edge.com/T044YC3MSLF-U0682748V1R-3d876dea5ee3-192",
      "Sharzad",
      "Zahraei",
      "11.11.1995",
      "+49 1515 53254235",
    ),
    UserProfile(
      "2",
      "https://ca.slack-edge.com/T044YC3MSLF-U05GXAU2DH6-75f1f34f2c6f-72",
      "David",
      "Sent",
      "11.11.1995",
      "+49 1515 35345345",
    ),
  ];

  @override
  UserProfile? getUser(String id) {
    for (UserProfile currentUser in userprofiles) {
      if (currentUser.id == id) {
        // we have a match
        return currentUser;
      }
    }
    return null;
  }

  @override
  void addUser(UserProfile user) {
    userprofiles.add(user);
  }
}
