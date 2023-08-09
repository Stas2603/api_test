import 'package:json_annotation/json_annotation.dart';

import 'network_user.dart';

part 'network_data.g.dart';

@JsonSerializable()
class NetworkData {
  NetworkData({
    required this.networkUsers,
  });

  @JsonKey(name: 'data')
  final List<NetworkUser> networkUsers;

  static const fromJson = _$NetworkDataFromJson;

  Map<String, dynamic> toJson() => _$NetworkDataToJson(this);
}
