import 'package:rosa/generated/json/base/json_convert_content.dart';
import 'package:rosa/generated/json/base/json_filed.dart';

class IndexBeanEntity with JsonConvert<IndexBeanEntity> {
	int status;
	String text;
	IndexBeanResult result;
}

class IndexBeanResult with JsonConvert<IndexBeanResult> {
	@JSONField(name: "ad_pic")
	List<IndexBeanResultAdPic> adPic;
	@JSONField(name: "best_goods")
	List<IndexBeanResultBestGood> bestGoods;
}

class IndexBeanResultAdPic with JsonConvert<IndexBeanResultAdPic> {
	String url;
	String link;
}

class IndexBeanResultBestGood with JsonConvert<IndexBeanResultBestGood> {
	@JSONField(name: "goods_id")
	int goodsId;
	@JSONField(name: "goods_img")
	String goodsImg;
	@JSONField(name: "goods_name")
	String goodsName;
	String tag;
	String price;
}
