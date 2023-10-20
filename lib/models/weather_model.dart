class WeatherModel {
  final String cityname;
  final String image;
  final DateTime date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondation;

  WeatherModel(
      {required this.cityname,
      required this.image,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondation});

  factory WeatherModel.fromJsion(json) {
    return WeatherModel(
        cityname: json["location"]['name'],
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        date: DateTime.parse(json["current"]["last_updated"]),
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherCondation: json["forecast"]["forecastday"][0]["day"]["condition"]
            ["text"]);
  }
}
