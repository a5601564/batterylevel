// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:batterylevel/business/banner_model_entity.dart';

import '../banner_model_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case BannerModelEntity:
			return bannerModelEntityFromJson(data as BannerModelEntity, json) as T;			case BannerModelList:
			return bannerModelListFromJson(data as BannerModelList, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case BannerModelEntity:
			return bannerModelEntityToJson(data as BannerModelEntity);			case BannerModelList:
			return bannerModelListToJson(data as BannerModelList);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'BannerModelEntity':
			return BannerModelEntity().fromJson(json);			case 'BannerModelList':
			return BannerModelList().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'BannerModelEntity':
			return List<BannerModelEntity>();			case 'BannerModelList':
			return List<BannerModelList>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}