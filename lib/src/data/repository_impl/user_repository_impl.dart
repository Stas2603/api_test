import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../api/user_api.dart';
import '../entity/network_user.dart';
import '../mappers/user_mapper.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.usersApi,
    required this.userMapper,
  });
  final UserApi usersApi;
  final UserMapper userMapper;

  @override
  Future<List<User>> takeUsers() async {
    final networkData = await usersApi.takeUsers();
    final networkUsers = networkData.networkUsers;

    final users = <User>[];

    await Future.forEach<NetworkUser>(networkUsers, (networkUser) async {
      users.add(
        userMapper.mapFromNetwork(
          networkUser,
        ),
      );
    });

    return users;
  }
}
