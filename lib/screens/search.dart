import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/location/openweather_location_provider.dart';
import 'package:weather_application/models/location_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController searchController;
  final OpenweatherLocation locationProvider = OpenweatherLocation();
  Future<List<Locations?>?>? getLocations;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 38, right: 38),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration:
                    const InputDecoration(hintText: 'Search for a City'),
              ),
              const SizedBox(
                height: 44,
              ),
              FutureBuilder<List<Locations?>?>(
                future: getLocations,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('Search a country'),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Country not found'),
                    );
                  }
                  return Column(
                    children: [
                      Text('Choose a country',
                          style: Theme.of(context).textTheme.headline5),
                      const SizedBox(
                        height: 22,
                      ),
                      for (var city in snapshot.data!)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, city.name);
                            },
                            child: Text(city!.name!),
                          ),
                        )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getLocations = OpenweatherLocation()
                .fetchLocations(city: searchController.text);
          });
        },
        child: const Icon(CupertinoIcons.search),
      ),
    );
  }
}
