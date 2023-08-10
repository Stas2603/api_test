import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/platform/network_info.dart';
import '../data/api/user_api.dart';
import '../data/mappers/user_mapper.dart';
import '../data/repository_impl/user_repository_impl.dart';
import '../data/shared_preferances/users_local_db.dart';
import '../domain/repository/user_repository.dart';
import '../domain/usecase/take_user_by_id.dart';
import '../domain/usecase/take_users_usecase.dart';
import '../presentation/screens/details_screen/detalis_screen_controller.dart';
import '../presentation/screens/main_screen/main_screen_controller.dart';

final dio = Dio();

Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //DB
  Get.lazyPut<UsersLocalDB>(
    () => UsersLocalDBImpl(sharedPreferences: Get.find()),
  );
  //Repository
  Get.lazyPut<UserRepository>(
    () => UserRepositoryImpl(
      userMapper: UserMapper(),
      usersApi: UserApi(dio),
      networkInfo: NetworkInfoImp(InternetConnectionChecker()),
      usersLocalDB: Get.find(),
    ),
  );
  //Usecases
  Get.lazyPut(() => TakeUsersUsecase(Get.find()));
  Get.lazyPut(() => TakeUserByIdUsecase(Get.find()));

  Get.lazyPut(() => MainScreenController(Get.find()));
  Get.lazyPut(() => DetailsScreenController(Get.find()));
}
