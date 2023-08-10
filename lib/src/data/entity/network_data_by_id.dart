import 'package:json_annotation/json_annotation.dart';

import 'network_user.dart';

part 'network_data_by_id.g.dart';

@JsonSerializable()
class NetworkDataById {
  NetworkDataById({
    required this.networkUser,
  });

  @JsonKey(name: 'data')
  final NetworkUser networkUser;

  static const fromJson = _$NetworkDataByIdFromJson;

  Map<String, dynamic> toJson() => _$NetworkDataByIdToJson(this);
}
