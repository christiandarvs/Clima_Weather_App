import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitPulse(
            size: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
