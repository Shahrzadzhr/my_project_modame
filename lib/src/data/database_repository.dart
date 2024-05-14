import 'package:my_project_modame/src/features/profile/domain/UserProfile.dart';

abstract class DatabaseRepository {
  UserProfile? getUser(String id);
  void addUser(UserProfile user);
}
