import 'package:clima_app/utilities/constant.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final Map locationWeather;
  const LocationScreen({super.key, required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    weather = weatherData['weather'][0]['main'];
    weatherDescription = weatherData['weather'][0]['description'];
    cityName = weatherData['name'];
    temperature = weatherData['main']['temp'];
    debugPrint(weather);
    debugPrint(weatherDescription);
    debugPrint(cityName);
  }

  String weather = '';
  String weatherDescription = '';
  String cityName = '';
  double temperature = 0;
  @override
  Widget build(BuildContext context) {
    updateUI(widget.locationWeather);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage('images/location_background.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop)),
          ),
          constraints: const BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            // updateUI(weatherData);
                          });
                        },
                        icon: const Icon(
                          Icons.location_on_sharp,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_city,
                          size: 50,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        '${temperature.toStringAsFixed(0)}°',
                        style: kTempTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '☀️',
                        style: kConditionTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    '${weatherDescription[0].toUpperCase()}${weatherDescription.substring(1)} in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//     final int condition = weatherData['weather'][0]['id'];
//     debugPrint('Temperature: $temperature');
//     debugPrint('Weather: $weather');
//     debugPrint('Weather Description: $weatherDescription');
//     debugPrint('City Name: $cityName');
//     debugPrint('Condition: $condition');
