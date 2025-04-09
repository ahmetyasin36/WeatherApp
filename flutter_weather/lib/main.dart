import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather_bloc_bloc.dart';
import 'package:flutter_weather/screens/home_screen.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<WeatherBlocBloc>(
        create: (context) => WeatherBlocBloc()..add(FetchWeather()),
        child: const HomeScreen(),
      ),
    );
  }
}

//(..) Cascade Operator
// var car = Car()
//   ..color = 'Red'
//   ..speed = 100
//   ..start();

// //Bunlar aynı
// var car = Car();
// car.color = 'Red';
// car.speed = 100;
// car.start();
