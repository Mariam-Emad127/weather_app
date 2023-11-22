import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class searchView extends StatelessWidget {
  const searchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search city"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              // WeatherModel  weatherModel = await WeatherServices(Dio())
              //    .getCurrentWeather(cityName: value);
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              hintText: "Enter city name",
              labelText: "search",
            ),
          ),
        ),
      ),
    );
  }
}
//WeatherModel ?weatherModel;
