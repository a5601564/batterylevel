import 'package:batterylevel/business/banner_model_entity.dart';

bannerModelEntityFromJson(BannerModelEntity data, Map<String, dynamic> json) {
	if (json['MembershiLevel'] != null) {
		data.membershiLevel = json['MembershiLevel']?.toString();
	}
	if (json['MembershiLevelIcon'] != null) {
		data.membershiLevelIcon = json['MembershiLevelIcon']?.toString();
	}
	if (json['List'] != null) {
		data.xList = new List<BannerModelList>();
		(json['List'] as List).forEach((v) {
			data.xList.add(new BannerModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> bannerModelEntityToJson(BannerModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['MembershiLevel'] = entity.membershiLevel;
	data['MembershiLevelIcon'] = entity.membershiLevelIcon;
	if (entity.xList != null) {
		data['List'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

bannerModelListFromJson(BannerModelList data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Link'] != null) {
		data.link = json['Link']?.toString();
	}
	if (json['ImgUrl'] != null) {
		data.imgUrl = json['ImgUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> bannerModelListToJson(BannerModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Title'] = entity.title;
	data['Link'] = entity.link;
	data['ImgUrl'] = entity.imgUrl;
	return data;
}