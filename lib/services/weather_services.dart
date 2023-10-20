import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "e185d9627ac6418c9e6202941231510";

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      // if(response.statusCode==201) {
      //   WeatherModel weatherModel = WeatherModel.fromJsion(response.data);
      // }else{
      //   final String errorMessage=response.data["error"]["message"];
      //   throw Exception(errorMessage);
      //
      // }
      WeatherModel weatherModel = WeatherModel.fromJsion(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there was an error, try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());

      throw Exception("oops there was an error, try later");
    }
  }
}
