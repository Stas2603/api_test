import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/api/user_api.dart';
import '../data/mappers/user_mapper.dart';
import '../data/repository_impl/user_repository_impl.dart';
import '../domain/repository/user_repository.dart';
import '../domain/usecase/take_users_usecase.dart';
import '../presentation/screens/main_screen/main_screen_controller.dart';

final dio = Dio();

void initInjector() {
  _initUsecases();
  _initRepositories();
  _initControllers();
}

void _initRepositories() {
  Get.put<UserRepository>(
    UserRepositoryImpl(
      userMapper: UserMapper(),
      usersApi: UserApi(dio),
    ),
  );
}

void _initUsecases() {
  Get.lazyPut(() => TakeUsersUsecase(Get.find()));
}

void _initControllers() {
  Get.put(MainScreenController(Get.find()));
}
