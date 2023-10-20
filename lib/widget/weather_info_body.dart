import 'package:flutter/material.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/main.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:[
              getThemeColor(weatherModel.weatherCondation),
              getThemeColor(weatherModel.weatherCondation)[300]!,
              getThemeColor(weatherModel.weatherCondation)[300]!] ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityname,
              //weatherModel.cityname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            //CustomText(weatherModel: weatherModel),
            Text(
              'updated at ${(weatherModel.date).hour}:${(weatherModel.date).minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel.image!}",
                  //    'assets/images/cloudy.png',
                ),
                Text(
                  weatherModel.temp.toString(),
                  //'17',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxtemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp:  ${weatherModel.mintemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondation,
              // 'Ligh Rain',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomText extends StatelessWidget {
//   const CustomText({
//     super.key,
//     required this.weatherModel,
//   });
//
//   final WeatherModel weatherModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       BlocProvider.of<GetWeatherCubit>(context).weatherModel.cityname,
//       //weatherModel.cityname,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 32,
//       ),
//     );
//   }
// }

// DateTime stringtoDataTime(String value){
//   return DateTime.parse(value);
// }
