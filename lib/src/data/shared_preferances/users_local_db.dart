import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exception/exception.dart';
import '../../domain/entity/user.dart';

abstract class UsersLocalDB {
  Future<List<User>> getUsersFromCache();
  Future<void> usersToCache(List<User> users);
  Future<User> getUserByIdFromCache(int id);
  Future<void> usersInfoToCache(User user);
}

const cachedUserList = 'CachedUserList';
const cachedUserInfoList = 'CachedUserInfoList';

class UsersLocalDBImpl implements UsersLocalDB {
  final SharedPreferences sharedPreferences;

  UsersLocalDBImpl({required this.sharedPreferences});

  @override
  Future<List<User>> getUsersFromCache() {
    final jsonUsersList = sharedPreferences.getStringList(cachedUserList) ?? [];
    if (jsonUsersList.isNotEmpty) {
      return Future.value(jsonUsersList
          .map((user) => User.fromJson(json.decode(user)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<User> getUserByIdFromCache(int id) async {
    final jsonUsersList =
        sharedPreferences.getStringList(cachedUserInfoList) ?? [];
    print('jsonUsersList: $jsonUsersList');
    if (jsonUsersList.isNotEmpty) {
      var _user = mockedUser;
      final users = await Future.value(jsonUsersList
          .map((user) => User.fromJson(json.decode(user)))
          .toList());

      for (var user in users) {
        if (user.id == id) {
          _user = user;
        }
      }
      return _user;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> usersToCache(List<User> user) async {
    final jsonUsersList =
        user.map((user) => json.encode(user.toJson())).toList();
    sharedPreferences.setStringList(cachedUserList, jsonUsersList);
  }

  @override
  Future<void> usersInfoToCache(User selectedUser) async {
    final jsonUsersListFromCache =
        sharedPreferences.getStringList(cachedUserInfoList) ?? [];
    final users = await Future.value(jsonUsersListFromCache
        .map((user) => User.fromJson(json.decode(user)))
        .toList());
    final newUsers = users;
    if (users.isEmpty) {
      newUsers.add(selectedUser);
    } else {
      final idList = [];
      for (var user in users) {
        idList.add(user.id);
      }
      if (idList.contains(selectedUser.id)) {
        newUsers.remove(selectedUser);
        newUsers.add(selectedUser);
      } else {
        newUsers.add(selectedUser);
      }
    }

    sharedPreferences.setStringList(cachedUserInfoList,
        newUsers.map((user) => json.encode(user.toJson())).toList());
    final jsonUsersListFromCacheNew =
        sharedPreferences.getStringList(cachedUserInfoList);
    print('jsonUsersListFromCacheNew: $jsonUsersListFromCacheNew');
  }
}
