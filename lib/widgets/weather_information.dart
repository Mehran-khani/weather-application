import 'package:flutter/material.dart';

TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.black.withOpacity(0.8));
Widget weatherInformation(
    String wind, String humidity, String pressure, String feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(32),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wind',
                style: titleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Pressure',
                style: titleStyle,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wind,
                style: titleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                pressure,
                style: titleStyle,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Humidity',
                style: titleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Feels Like',
                style: titleStyle,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                humidity,
                style: titleStyle,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                feelsLike,
                style: titleStyle,
              )
            ],
          ),
        ]),
  );
}
