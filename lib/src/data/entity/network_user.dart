import 'package:json_annotation/json_annotation.dart';

part 'network_user.g.dart';

@JsonSerializable()
class NetworkUser {
  NetworkUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'avatar')
  final String avatar;

  static const fromJson = _$NetworkUserFromJson;

  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);
}
