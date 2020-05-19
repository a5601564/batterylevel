import 'package:flutter/services.dart';

class AesUtil{
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  static Future<int> getBatteryLevel() async {

    return await platform.invokeMethod('getBatteryLevel');
  }

  static Future<String> encrypt(String data, String key, String iv) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'data': data,
      'key': key,
      'iv': iv,
    };
    return await platform.invokeMethod("encrypt", params);
  }

  static Future<String> unicode(String data) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'data': data,
    };
    return await platform.invokeMethod("unicode",params);
  }

}