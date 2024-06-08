import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_response.freezed.dart';
part 'create_order_response.g.dart';

@freezed
class CreateOrderResponse with _$CreateOrderResponse {
  factory CreateOrderResponse({
    @Default('') @JsonKey(name: 'zp_trans_token') String zptranstoken,
    @Default('') @JsonKey(name: 'order_url') String orderurl,
    @Default(0) @JsonKey(name: 'return_code') int returncode,
    @Default('') @JsonKey(name: 'return_message') String returnmessage,
    @Default(0) @JsonKey(name: 'sub_return_code') int subreturncode,
    @Default('') @JsonKey(name: 'sub_return_message') String subreturnmessage,
    @Default('') @JsonKey(name: 'order_token') String ordertoken,
  }) = _CreateOrderResponse;

  // Factory method to create an instance of CreateOrderResponse from a JSON object
  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
}
