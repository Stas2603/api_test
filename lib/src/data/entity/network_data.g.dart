// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkData _$NetworkDataFromJson(Map<String, dynamic> json) => NetworkData(
      networkUsers: (json['data'] as List<dynamic>)
          .map((e) => NetworkUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkDataToJson(NetworkData instance) =>
    <String, dynamic>{
      'data': instance.networkUsers,
    };
