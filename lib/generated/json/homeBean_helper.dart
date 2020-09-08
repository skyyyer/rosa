import 'package:rosa/model/homeBean.dart';

homeBeanEntityFromJson(HomeBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['mes'] != null) {
		data.mes = json['mes']?.toString();
	}
	if (json['result'] != null) {
		data.result = new List<HomeBeanResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new HomeBeanResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeBeanEntityToJson(HomeBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['mes'] = entity.mes;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

homeBeanResultFromJson(HomeBeanResult data, Map<String, dynamic> json) {
	if (json['city_id'] != null) {
		data.cityId = json['city_id']?.toInt();
	}
	if (json['city_name'] != null) {
		data.cityName = json['city_name']?.toString();
	}
	if (json['city_cover'] != null) {
		data.cityCover = json['city_cover']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanResultToJson(HomeBeanResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city_id'] = entity.cityId;
	data['city_name'] = entity.cityName;
	data['city_cover'] = entity.cityCover;
	return data;
}