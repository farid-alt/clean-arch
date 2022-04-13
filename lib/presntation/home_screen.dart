import 'package:clean_arch_test2/presntation/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  late WeatherCubit _weatherCubit;
  @override
  void initState() {
    _weatherCubit = WeatherCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: _weatherCubit,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.weather != null)
                Column(
                  children: [
                    Text(
                      state.weather!.cityName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      state.weather!.temperature.toString() + 'F',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      state.weather!.description,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(hintText: 'here')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_textEditingController.text.isNotEmpty) {
                          _weatherCubit
                              .onGetWeather(_textEditingController.text);
                        }
                      },
                      child: Text('Search'))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
