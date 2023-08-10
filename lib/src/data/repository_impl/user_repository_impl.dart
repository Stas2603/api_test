import '../../core/exception/exception.dart';
import '../../core/platform/network_info.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../api/user_api.dart';
import '../entity/network_user.dart';
import '../mappers/user_mapper.dart';
import '../shared_preferances/users_local_db.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.usersApi,
    required this.userMapper,
    required this.usersLocalDB,
    required this.networkInfo,
  });

  final UserApi usersApi;
  final UserMapper userMapper;
  final UsersLocalDB usersLocalDB;
  final NetworkInfo networkInfo;

  @override
  Future<List<User>> takeUsers() async {
    if (await networkInfo.isConnected) {
      try {
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

        usersLocalDB.usersToCache(users);

        return users;
      } on ServerException {
        throw ServerException();
      }
    } else {
      try {
        final localUsers = await usersLocalDB.getUsersFromCache();

        return localUsers;
      } on CacheException {
        throw CacheException();
      }
    }
  }

  @override
  Future<User> takeUserById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final networkData = await usersApi.takeUserById(id);
        final user = userMapper.mapFromNetwork(networkData.networkUser);

        usersLocalDB.usersInfoToCache(user);

        return user;
      } on ServerException {
        throw ServerException();
      }
    } else {
      try {
        final localUser = await usersLocalDB.getUserByIdFromCache(id);
        print(localUser);
        return localUser;
      } on CacheException {
        throw CacheException();
      }
    }
  }
}
