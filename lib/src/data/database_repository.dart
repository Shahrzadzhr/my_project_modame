import 'package:my_project_modame/src/features/profile/domain/user_profil.dart';

abstract class DatabaseRepository {
  Future<UserProfile?> getUser(String id);
  Future<void> addUser(UserProfile user);
  Future<void> updateUser(UserProfile user);
}
