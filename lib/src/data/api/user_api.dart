import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/network_data.dart';
import '../entity/network_data_by_id.dart';

part 'user_api.g.dart';

@RestApi(
  baseUrl: 'https://reqres.in/api/',
)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('users?page=2')
  Future<NetworkData> takeUsers();

  @GET('users/{id}')
  Future<NetworkDataById> takeUserById(@Path() int id);
}
