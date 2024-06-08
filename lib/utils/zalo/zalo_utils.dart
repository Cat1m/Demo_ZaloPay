import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:sample_flutter/repository/payment_zalo/payment_zalo.dart';
import 'package:sprintf/sprintf.dart';

class ZaloUtils {
  static String formatNumber(double value) {
    final f = NumberFormat("#,###", "vi_VN");
    return f.format(value);
  }

  static String formatDateTime(DateTime dateTime, String layout) {
    return DateFormat(layout).format(dateTime).toString();
  }

  static int transIdDefault = 1;

  static String getAppTransId() {
    if (transIdDefault >= 100000) {
      transIdDefault = 1;
    }

    transIdDefault += 1;
    var timeString = formatDateTime(DateTime.now(), "yyMMdd_hhmmss");
    return sprintf("%s%06d", [timeString, transIdDefault]);
  }

  static String getBankCode() => "zalopayapp";

  static String getDescription(String apptransid) =>
      "Merchant Demo thanh toán cho đơn hàng #$apptransid";

  static String getMacCreateOrder(String data) {
    // Assume ZaloPayConfig.key1 is defined somewhere
    var hmac = Hmac(sha256, utf8.encode(ZaloPayConfig.key1));
    return hmac.convert(utf8.encode(data)).toString();
  }
}
