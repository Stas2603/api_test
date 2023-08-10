import '../entity/user.dart';

abstract class UserRepository {
  Future<List<User>> takeUsers();

  Future<User> takeUserById(int id);
}
