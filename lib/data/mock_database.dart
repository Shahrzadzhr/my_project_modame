import 'database_repository.dart';
 import '../domain/UserProfile.dart';

   class MockDatabase implements DatabaseRepository {
   List<UserProfile> userprofiles = [];
   @override 
   List<UserProfile> getAllUsers() {
    return userprofiles;  

   }
  @override
  void addUser(UserProfile user) {
    userprofiles.add(user);
    
  }
   }