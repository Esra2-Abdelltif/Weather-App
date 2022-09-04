
import 'package:weather_app/weather_app_angela/sevices/location.dart';
import 'package:weather_app/weather_app_angela/sevices/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async {

    NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=325b1f7d3e78b0cf9c9457a13b8b41d5&units=metric");
    var weatherData= await  networkHelper.getWeatherData();
    return weatherData;


  }
  Future<dynamic> getlocationWeather() async {
    Location location = Location();
    await location.getCurrentlocation();

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=325b1f7d3e78b0cf9c9457a13b8b41d5&units=metric");
    var weatherData= await networkHelper.getWeatherData();
    return weatherData;


  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

// class WeatherModel {
//   Coord? coord;
//   List<Weather>? weather;
//   String? base;
//   Main? main;
//   int? visibility;
//   Wind? wind;
//   Clouds? clouds;
//   int? dt;
//   Sys? sys;
//   int? timezone;
//   int? id;
//   String? name;
//   int? cod;
//
//   WeatherModel(
//       {this.coord,
//         this.weather,
//         this.base,
//         this.main,
//         this.visibility,
//         this.wind,
//         this.clouds,
//         this.dt,
//         this.sys,
//         this.timezone,
//         this.id,
//         this.name,
//         this.cod});
//
//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather!.add(Weather.fromJson(v));
//       });
//     }
//     base = json['base'];
//     main = json['main'] != null ? Main.fromJson(json['main']) : null;
//     visibility = json['visibility'];
//     wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
//     clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
//     dt = json['dt'];
//     sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
//     timezone = json['timezone'];
//     id = json['id'];
//     name = json['name'];
//     cod = json['cod'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (coord != null) {
//       data['coord'] = coord!.toJson();
//     }
//     if (weather != null) {
//       data['weather'] = weather!.map((v) => v.toJson()).toList();
//     }
//     data['base'] = base;
//     if (main != null) {
//       data['main'] = main!.toJson();
//     }
//     data['visibility'] = visibility;
//     if (wind != null) {
//       data['wind'] = wind!.toJson();
//     }
//     if (clouds != null) {
//       data['clouds'] = clouds!.toJson();
//     }
//     data['dt'] = dt;
//     if (sys != null) {
//       data['sys'] = sys!.toJson();
//     }
//     data['timezone'] = timezone;
//     data['id'] = id;
//     data['name'] = name;
//     data['cod'] = cod;
//     return data;
//   }
// }
//
// class Coord {
//   double? lon;
//   double? lat;
//
//   Coord({this.lon, this.lat});
//
//   Coord.fromJson(Map<String, dynamic> json) {
//     lon = json['lon'];
//     lat = json['lat'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lon'] = lon;
//     data['lat'] = lat;
//     return data;
//   }
// }
//
// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;
//
//   Weather({this.id, this.main, this.description, this.icon});
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['main'] = main;
//     data['description'] = description;
//     data['icon'] = icon;
//     return data;
//   }
// }
//
// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? humidity;
//
//   Main(
//       {this.temp,
//         this.feelsLike,
//         this.tempMin,
//         this.tempMax,
//         this.pressure,
//         this.humidity});
//
//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     tempMin = json['temp_min'];
//     tempMax = json['temp_max'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['temp'] = temp;
//     data['feels_like'] = feelsLike;
//     data['temp_min'] = tempMin;
//     data['temp_max'] = tempMax;
//     data['pressure'] = pressure;
//     data['humidity'] = humidity;
//     return data;
//   }
// }
//
// class Wind {
//   double? speed;
//   int? deg;
//
//   Wind({this.speed, this.deg});
//
//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     deg = json['deg'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['speed'] = speed;
//     data['deg'] = deg;
//     return data;
//   }
// }
//
// class Clouds {
//   int? all;
//
//   Clouds({this.all});
//
//   Clouds.fromJson(Map<String, dynamic> json) {
//     all = json['all'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['all'] = all;
//     return data;
//   }
// }
//
// class Sys {
//   int? type;
//   int? id;
//   String? country;
//   int? sunrise;
//   int? sunset;
//
//   Sys({this.type, this.id, this.country, this.sunrise, this.sunset});
//
//   Sys.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     id = json['id'];
//     country = json['country'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['type'] = type;
//     data['id'] = id;
//     data['country'] = country;
//     data['sunrise'] = sunrise;
//     data['sunset'] = sunset;
//     return data;
//   }
// }
