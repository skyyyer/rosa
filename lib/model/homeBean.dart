import 'package:rosa/generated/json/base/json_convert_content.dart';
import 'package:rosa/generated/json/base/json_filed.dart';

class HomeBeanEntity with JsonConvert<HomeBeanEntity> {
	int code;
	String mes;
	List<HomeBeanResult> result;
}

class HomeBeanResult with JsonConvert<HomeBeanResult> {
	@JSONField(name: "city_id")
	int cityId;
	@JSONField(name: "city_name")
	String cityName;
	@JSONField(name: "city_cover")
	String cityCover;
}
