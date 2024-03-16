class WeatherData {
  num precipitation;
  num clouds;

  WeatherData(this.precipitation, this.clouds);
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    num precipitation = json['current']['precipitation'];
    num clouds = json['current']['cloud_cover'];

    return WeatherData(precipitation, clouds);
  }
}

/**
 * {
    "latitude": 59.439518,
    "longitude": 24.75708,
    "generationtime_ms": 0.028014183044433594,
    "utc_offset_seconds": 0,
    "timezone": "GMT",
    "timezone_abbreviation": "GMT",
    "elevation": 10.0,
    "current_units": {
    "time": "iso8601",
    "interval": "seconds",
    "temperature_2m": "°C",
    "is_day": "",
    "precipitation": "mm",
    "cloud_cover": "%"
    },
    "current": {
    "time": "2024-03-16T08:30",
    "interval": 900,
    "temperature_2m": 5.8,
    "is_day": 1,
    "precipitation": 0.00,
    "cloud_cover": 100
    }
    }
 */