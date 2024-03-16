
import 'package:dear_diary/entities/weather_data.dart';

String getWeatherIcon(WeatherData wd) {
  if (wd.precipitation > 5) {
    return '🌨';
  }
  if (wd.precipitation > 0 && wd.clouds < 50) {
    return '🌦';
  }
  if (wd.precipitation > 0) {
    return '🌧';
  }
  if (wd.clouds > 70) {
    return '☁️';
  }
  if (wd.clouds > 20) {
    return '⛅';
  }
  return '☀️';
}