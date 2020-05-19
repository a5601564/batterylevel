import 'package:batterylevel/json/base/json_convert_content.dart';
import 'package:batterylevel/json/base/json_filed.dart';

class BannerModelEntity with JsonConvert<BannerModelEntity> {
	@JSONField(name: "MembershiLevel")
	String membershiLevel;
	@JSONField(name: "MembershiLevelIcon")
	String membershiLevelIcon;
	@JSONField(name: "List")
	List<BannerModelList> xList;
}

class BannerModelList with JsonConvert<BannerModelList> {
	@JSONField(name: "Id")
	int id;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Link")
	String link;
	@JSONField(name: "ImgUrl")
	String imgUrl;
}
