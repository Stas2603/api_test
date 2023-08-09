import '../../domain/entity/user.dart';
import '../entity/network_user.dart';

class UserMapper {
  UserMapper();

  User mapFromNetwork(
    NetworkUser networkUser,
  ) =>
      User(
        id: networkUser.id,
        email: networkUser.email,
        firstName: networkUser.firstName,
        lastName: networkUser.lastName,
        photo: networkUser.avatar,
      );
}
