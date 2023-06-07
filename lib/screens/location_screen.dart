import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:clima_app/utilities/constant.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({super.key, required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String weather = '';
  String weatherDescription = '';
  String cityName = '';
  String weatherIcon = '';
  String weatherMessage = '';
  int temperature = 0;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      return;
    }
    weather = weatherData['weather'][0]['main'];
    weatherDescription = weatherData['weather'][0]['description'];
    cityName = weatherData['name'];
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(condition);
    weatherMessage = weatherModel.getMessage(temperature);
  }

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
                          var weatherData =
                              await weatherModel.getLocationWeather();

                          setState(() {
                            updateUI(weatherData);
                          });
                        },
                        icon: const Icon(
                          Icons.location_on_sharp,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CityScreen(),
                              ));

                          if (typedName != null) {
                            var weatherData =
                                await weatherModel.getCityWeather(typedName);
                            print(weatherData);
                            setState(() {
                              updateUI(weatherData);
                            });
                          }
                        },
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
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    '$weatherMessage in $cityName',
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
