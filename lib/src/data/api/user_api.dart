import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/network_data.dart';

part 'user_api.g.dart';

@RestApi(
  baseUrl: 'https://reqres.in/api/users?page=2',
)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('')
  Future<NetworkData> takeUsers();
}
