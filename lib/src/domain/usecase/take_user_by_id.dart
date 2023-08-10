import 'package:equatable/equatable.dart';
import '../entity/user.dart';
import '../repository/user_repository.dart';
import 'base_usecase.dart';

class TakeUserByIdUsecase
    extends BaseUseCaseParams<String, TakePictureFromIdUsecaseParams> {
  TakeUserByIdUsecase(this.userRepository);
  final UserRepository userRepository;

  @override
  Future<User> call(TakePictureFromIdUsecaseParams params) async =>
      userRepository.takeUserById(params.id);
}

class TakePictureFromIdUsecaseParams extends Equatable {
  const TakePictureFromIdUsecaseParams({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
