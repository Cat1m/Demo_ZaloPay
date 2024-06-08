// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderResponseImpl _$$CreateOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderResponseImpl(
      zptranstoken: json['zp_trans_token'] as String? ?? '',
      orderurl: json['order_url'] as String? ?? '',
      returncode: (json['return_code'] as num?)?.toInt() ?? 0,
      returnmessage: json['return_message'] as String? ?? '',
      subreturncode: (json['sub_return_code'] as num?)?.toInt() ?? 0,
      subreturnmessage: json['sub_return_message'] as String? ?? '',
      ordertoken: json['order_token'] as String? ?? '',
    );

Map<String, dynamic> _$$CreateOrderResponseImplToJson(
        _$CreateOrderResponseImpl instance) =>
    <String, dynamic>{
      'zp_trans_token': instance.zptranstoken,
      'order_url': instance.orderurl,
      'return_code': instance.returncode,
      'return_message': instance.returnmessage,
      'sub_return_code': instance.subreturncode,
      'sub_return_message': instance.subreturnmessage,
      'order_token': instance.ordertoken,
    };
