import 'package:pro_task_weather/features/clean_weeather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({required super.location, required super.current});
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: LocationModel.fromJson(json["location"]),
        current: CurrentModel.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": (location as LocationModel).toJson(),
        "current": (current as CurrentModel).toJson(),
      };
}

class CurrentModel extends Current {
  CurrentModel(
      {required super.lastUpdatedEpoch,
      required super.lastUpdated,
      required super.tempC,
      required super.tempF,
      required super.isDay,
      required super.condition,
      required super.windMph,
      required super.windKph,
      required super.windDegree,
      required super.windDir,
      required super.pressureMb,
      required super.pressureIn,
      required super.precipMm,
      required super.precipIn,
      required super.humidity,
      required super.cloud,
      required super.feelslikeC,
      required super.feelslikeF,
      required super.windchillC,
      required super.windchillF,
      required super.heatindexC,
      required super.heatindexF,
      required super.dewpointC,
      required super.dewpointF,
      required super.visKm,
      required super.visMiles,
      required super.uv,
      required super.gustMph,
      required super.gustKph});
 factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
  lastUpdatedEpoch: json["last_updated_epoch"],
  lastUpdated: json["last_updated"],
  tempC: json["temp_c"]?.toDouble(),
  tempF: json["temp_f"]?.toDouble(),
  isDay: json["is_day"],
  condition: ConditionModel.fromJson(json["condition"]),
  windMph: json["wind_mph"]?.toDouble(),
  windKph: json["wind_kph"]?.toDouble(),
  windDegree: json["wind_degree"],
  windDir: json["wind_dir"],
  pressureMb: json["pressure_mb"]?.toDouble(), // Ensure it's double
  pressureIn: json["pressure_in"]?.toDouble(),
  precipMm: json["precip_mm"]?.toDouble(), // Ensure it's double
  precipIn: json["precip_in"]?.toDouble(), // Ensure it's double
  humidity: json["humidity"],
  cloud: json["cloud"],
  feelslikeC: json["feelslike_c"]?.toDouble(),
  feelslikeF: json["feelslike_f"]?.toDouble(),
  windchillC: json["windchill_c"]?.toDouble(),
  windchillF: json["windchill_f"]?.toDouble(),
  heatindexC: json["heatindex_c"]?.toDouble(),
  heatindexF: json["heatindex_f"]?.toDouble(),
  dewpointC: json["dewpoint_c"]?.toDouble(),
  dewpointF: json["dewpoint_f"]?.toDouble(),
  visKm: json["vis_km"]?.toDouble(), // Ensure it's double
  visMiles: json["vis_miles"]?.toDouble(), // Ensure it's double
  uv: json["uv"]?.toDouble(), // Ensure it's double
  gustMph: json["gust_mph"]?.toDouble(),
  gustKph: json["gust_kph"]?.toDouble(),
);

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": (condition as ConditionModel).toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };
}

class ConditionModel extends Condition {
  ConditionModel(
      {required super.text, required super.icon, required super.code});
  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class LocationModel extends Location {
  LocationModel(
      {required super.name,
      required super.region,
      required super.country,
      required super.lat,
      required super.lon,
      required super.tzId,
      required super.localtimeEpoch,
      required super.localtime});
  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
//! eplain as record in phone