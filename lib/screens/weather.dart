import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/screens/search.dart';
import 'package:weather_application/weather/bloc/weather_bloc.dart';
import 'package:weather_application/widgets/weather_information.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Completer<void> completer;

  @override
  void initState() {
    completer = Completer<void>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 22),
          child: IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherRefreshEvent(city: city));
              }
            },
          ),
        ),
      ]),
      body: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, weatherState) async {
          if (WeatherState is WeatherSuccess) {
            completer.complete();
            completer = Completer();
          }
          if (WeatherState is WeatherLoading) {
            await showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
        },
        builder: (context, weatherState) {
          if (weatherState is WeatherSuccess) {
            final weather = weatherState.weather;
            return BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<WeatherBloc>(context).add(
                        WeatherRefreshEvent(city: weather.name.toString()));
                    // return completer.future;
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 44),
                    child: ListView(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                weather.name.toString(),
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                              ),
                              Text(
                                '${weatherState.weather.main!.temp.toString()}°',
                                style: const TextStyle(fontSize: 32),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const Text(
                                'Weather Information',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              weatherInformation(
                                  weatherState.weather.wind!.speed.toString(),
                                  weatherState.weather.main!.humidity
                                      .toString(),
                                  weatherState.weather.main!.pressure
                                      .toString(),
                                  weatherState.weather.main!.feelsLike
                                      .toString())
                              // Text(
                              //     'Weather is ${weatherState.weather.main!.temp}')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (weatherState is WeatherFailure) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const Center(
            child: Text('Select a city first'),
          );
        },
      )),
    );
  }
}
