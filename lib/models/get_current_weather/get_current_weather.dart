class GetCurrentWeather {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Rain? rain;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  GetCurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory GetCurrentWeather.fromJson(Map<String, dynamic> json) {
    return GetCurrentWeather(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((x) => Weather.fromJson(x))
          .toList(),
      base: json['base'] ?? '',
      main: Main.fromJson(json['main']),
      visibility: json['visibility'] ?? 0,
      wind: Wind.fromJson(json['wind']),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'] ?? 0,
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      cod: json['cod'] ?? 0,
    );
  }
}

class Coord {
  double lon;
  double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: (json['lon'] as num).toDouble(),
    lat: (json['lat'] as num).toDouble(),
  );
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json['id'] ?? 0,
    main: json['main'] ?? '',
    description: json['description'] ?? '',
    icon: json['icon'] ?? '',
  );
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int? seaLevel; // bisa null
  int? grndLevel; // bisa null

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    tempMin: (json['temp_min'] as num).toDouble(),
    tempMax: (json['temp_max'] as num).toDouble(),
    pressure: json['pressure'] ?? 0,
    humidity: json['humidity'] ?? 0,
    seaLevel: json['sea_level'], // nullable, biarkan null kalau tidak ada
    grndLevel: json['grnd_level'], // nullable
  );
}

class Wind {
  double speed;
  int deg;
  double? gust; // nullable

  Wind({required this.speed, required this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: (json['speed'] as num).toDouble(),
    deg: json['deg'] ?? 0,
    gust: json['gust'] != null ? (json['gust'] as num).toDouble() : null,
  );
}

class Rain {
  double? the1H; // nullable

  Rain({this.the1H});

  factory Rain.fromJson(Map<String, dynamic> json) =>
      Rain(the1H: json['1h'] != null ? (json['1h'] as num).toDouble() : null);
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(all: json['all'] ?? 0);
}

class Sys {
  int? type; // nullable
  int? id; // nullable
  String country;
  int sunrise;
  int sunset;

  Sys({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json['type'],
    id: json['id'],
    country: json['country'] ?? '',
    sunrise: json['sunrise'] ?? 0,
    sunset: json['sunset'] ?? 0,
  );
}
