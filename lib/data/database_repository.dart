import '../domain/UserProfile.dart';

abstract class DatabaseRepository {
 List<UserProfile> getAllUsers();
 void addUser(UserProfile user);
 







}