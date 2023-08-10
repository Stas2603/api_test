// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_data_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkDataById _$NetworkDataByIdFromJson(Map<String, dynamic> json) =>
    NetworkDataById(
      networkUser: NetworkUser.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkDataByIdToJson(NetworkDataById instance) =>
    <String, dynamic>{
      'data': instance.networkUser,
    };
