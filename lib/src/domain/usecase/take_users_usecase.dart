import '../entity/user.dart';
import '../repository/user_repository.dart';
import 'base_usecase.dart';

class TakeUsersUsecase extends BaseUseCase<List<User>> {
  TakeUsersUsecase(this.userRepository);
  final UserRepository userRepository;

  @override
  Future<List<User>> call() async => userRepository.takeUsers();
}
