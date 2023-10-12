import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => GetWeatherCubit()),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Patchy light rain with thunder':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Light drizzle':
    case 'Light freezing drizzle':
    case 'Light sleet':
    case 'Light snow':
    case 'Light showers of ice pellets':
    case 'Light rain shower':
    case 'Light sleet showers':
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy freezing rain':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy snow':
    case 'Moderate or heavy showers of ice pellets':
    case 'Moderate or heavy rain shower':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.blue;
    case 'Heavy freezing drizzle':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Heavy freezing drizzle':
    case 'Heavy snow':
    case 'Torrential rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.indigo;
    case 'Ice pellets':
      return Colors.cyan;
    default:
      return Colors.blue;
  }
}
