import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:batterylevel/business/ResultModel.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

class NetUtils {
  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  static Future<ResultModel> post(
      String url, Map<String, dynamic> params) async {
    var response = await dio.post(url, data: params);

    print(response);
    ResultModel resultModel = ResultModel.FromJson(json.decode(response.data));

    return resultModel;
  }
}
