import 'package:batterylevel/business/ResultModel.dart';
import 'package:batterylevel/business/banner_model_entity.dart';
import 'package:batterylevel/json/base/json_convert_content.dart';
import 'package:batterylevel/util/base_param.dart';
import 'package:batterylevel/util/constant.dart';
import 'package:batterylevel/util/net_utils.dart';

class NetUtil {
  static Future<BannerModelEntity> getBanner() async {
    Map<String, String> map = {'Action': 'GetBanner'};

    String data=await BaseParam.buildParam(map, "System");
    ResultModel resultModel = await NetUtils.post(
        Constant.BaseUrl, {'Data': data});

    BannerModelEntity bannerModelEntity =
        JsonConvert.fromJsonAsT(resultModel.data);

    return bannerModelEntity;
  }
}
