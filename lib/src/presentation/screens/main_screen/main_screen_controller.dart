import 'package:get/get.dart';

import '../../../domain/entity/user.dart';
import '../../../domain/usecase/take_users_usecase.dart';

class MainScreenController extends GetxController {
  MainScreenController(this._takeUsersUsecase);

  final TakeUsersUsecase _takeUsersUsecase;

  RxList<User> users = <User>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    takeUsers();
  }

  Future<void> takeUsers() async {
    final userList = await _takeUsersUsecase.call();
    users.value = userList;
  }
}
