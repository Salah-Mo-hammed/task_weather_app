
abstract class WeatherEvent {
  const WeatherEvent();
}


class GetWeatherEvent extends WeatherEvent {
  final String location;
  const GetWeatherEvent({required this.location});
}
class GetAutoWeatherEvent extends WeatherEvent {
  const GetAutoWeatherEvent();
}