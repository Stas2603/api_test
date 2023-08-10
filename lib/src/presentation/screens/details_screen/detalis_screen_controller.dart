import 'package:get/get.dart';

import '../../../domain/entity/user.dart';
import '../../../domain/usecase/take_user_by_id.dart';

class DetailsScreenController extends GetxController {
  DetailsScreenController(this._takeUserByIdUsecase);

  final TakeUserByIdUsecase _takeUserByIdUsecase;

  Rx<User> user = mockedUser.obs;
  RxBool isLoading = false.obs;
  RxInt id = 1.obs;

  @override
  void onReady() {
    final id = Get.arguments ?? 1;
    takeUserById(id);
    super.onInit();
  }

  Future<void> takeUserById(int id) async {
    final userById =
        await _takeUserByIdUsecase.call(TakePictureFromIdUsecaseParams(id: id));
    user.value = userById;
  }
}
