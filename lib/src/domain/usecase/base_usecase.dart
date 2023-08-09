abstract class BaseUseCase<Type> {
  Future<Type> call();
}

abstract class BaseUseCaseParams<Type, Params> {
  Future<void> call(Params params);
}
