import 'package:clean_arch_test2/presntation/cubit/weather_cubit.dart';
import 'package:clean_arch_test2/presntation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => WeatherCubit())],
          child: HomeScreen(),
        ),
      ),
    );
  }
}
