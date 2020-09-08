import 'package:rosa/model/index_bean_entity.dart';

indexBeanEntityFromJson(IndexBeanEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['result'] != null) {
		data.result = new IndexBeanResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> indexBeanEntityToJson(IndexBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['text'] = entity.text;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

indexBeanResultFromJson(IndexBeanResult data, Map<String, dynamic> json) {
	if (json['ad_pic'] != null) {
		data.adPic = new List<IndexBeanResultAdPic>();
		(json['ad_pic'] as List).forEach((v) {
			data.adPic.add(new IndexBeanResultAdPic().fromJson(v));
		});
	}
	if (json['best_goods'] != null) {
		data.bestGoods = new List<IndexBeanResultBestGood>();
		(json['best_goods'] as List).forEach((v) {
			data.bestGoods.add(new IndexBeanResultBestGood().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> indexBeanResultToJson(IndexBeanResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.adPic != null) {
		data['ad_pic'] =  entity.adPic.map((v) => v.toJson()).toList();
	}
	if (entity.bestGoods != null) {
		data['best_goods'] =  entity.bestGoods.map((v) => v.toJson()).toList();
	}
	return data;
}

indexBeanResultAdPicFromJson(IndexBeanResultAdPic data, Map<String, dynamic> json) {
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['link'] != null) {
		data.link = json['link']?.toString();
	}
	return data;
}

Map<String, dynamic> indexBeanResultAdPicToJson(IndexBeanResultAdPic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['url'] = entity.url;
	data['link'] = entity.link;
	return data;
}

indexBeanResultBestGoodFromJson(IndexBeanResultBestGood data, Map<String, dynamic> json) {
	if (json['goods_id'] != null) {
		data.goodsId = json['goods_id']?.toInt();
	}
	if (json['goods_img'] != null) {
		data.goodsImg = json['goods_img']?.toString();
	}
	if (json['goods_name'] != null) {
		data.goodsName = json['goods_name']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	return data;
}

Map<String, dynamic> indexBeanResultBestGoodToJson(IndexBeanResultBestGood entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['goods_id'] = entity.goodsId;
	data['goods_img'] = entity.goodsImg;
	data['goods_name'] = entity.goodsName;
	data['tag'] = entity.tag;
	data['price'] = entity.price;
	return data;
}