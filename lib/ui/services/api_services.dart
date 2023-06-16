import 'dart:convert';

import 'package:http/http.dart';
import '../../const/const.dart';
import '../../models/weather_model.dart';

class ApiServices {
  Future<WeatherModel> getWeatherData(String searchText) async {
    String url = "$base_url&q=$searchText&days=7&lang=bn&";

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var date = response.bodyBytes;
        var banglaText = utf8.decode(date);

        return weatherModelFromJson(banglaText);
      } else {
        throw ("Not Data Found");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
