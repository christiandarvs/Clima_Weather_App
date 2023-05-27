import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/get_permission.dart';

class ClimaPage extends StatefulWidget {
  const ClimaPage({super.key});

  @override
  State<ClimaPage> createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  @override
  void initState() {
    super.initState();
    getPermission();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLoc();
    debugPrint('${location.latitude}');
    debugPrint('${location.longitude}');
    getWeather(location.latitude, location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center()),
    );
  }
}
