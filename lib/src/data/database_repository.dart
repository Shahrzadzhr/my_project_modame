import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

abstract class DatabaseRepository {
  UserProfile? getUser(String id);
  void addUser(UserProfile user);
}
