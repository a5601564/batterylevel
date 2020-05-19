import 'dart:convert';
import 'dart:io';

import 'package:batterylevel/util/constant.dart';

import '../AesUtil.dart';

abstract class BaseParam {
  static Future<String> buildParam(
      Map<String, dynamic> params, String serviceName) async {
//    User user = await UserManager.getInstance().getUser();
    params.putIfAbsent("Service", () => serviceName);
    params.putIfAbsent("Token", () => "");
    params.putIfAbsent("Version", () => Platform.version);
    params.putIfAbsent("Platform", () => Constant.Platform);
//    String uuid = await FlutterGetuuid.platformUid;
    params.putIfAbsent("UniqueId", () => "");

    print(params);
    String paramStr = json.encode(params);
    paramStr = await AesUtil.unicode(paramStr);
    print(paramStr);
    paramStr =
        await AesUtil.encrypt(paramStr, Constant.AES_KEY, Constant.AES_IV);

    print(paramStr);
    return paramStr;
  }
}
