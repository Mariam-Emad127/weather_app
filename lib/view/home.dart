import 'package:flutter/material.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/view/search_view.dart';
import 'package:weather_application/widget/no_weather_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/widget/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("weather app"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return searchView();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (BuildContext context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weather : state.weatherModel,
                  );
            } else {
              return Text('ppps there was error');
            }
          },
        ));
  }
}
