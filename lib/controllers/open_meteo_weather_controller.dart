import 'dart:convert';

import 'package:dear_diary/entities/weather_data.dart';
import 'package:http/http.dart' as http;

const String endpoint =
    'https://api.open-meteo.com/v1/forecast?latitude=59.437&longitude=24.7535&current=temperature_2m,is_day,precipitation,cloud_cover&forecast_days=1';

Future<WeatherData> fetchWeather() async {
  var response = await http.get(Uri.parse(endpoint));
  if (response.statusCode == 200) {
    WeatherData w = WeatherData.fromJson(jsonDecode(response.body));
    return w;
  } else {
    throw Exception('Failed to load the weather');
  }
}
