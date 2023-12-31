import 'package:weather_application/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailerState extends WeatherState {
  final String errorMessage;

  WeatherFailerState(this.errorMessage);
}
