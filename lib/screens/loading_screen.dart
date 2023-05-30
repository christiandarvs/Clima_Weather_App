import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    }
    debugPrint('$position');
    debugPrint('${position.latitude}');
    debugPrint('${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '20';
    double? convert;
    try {
      convert = double.parse(myMargin);
    } catch (e) {
      debugPrint('$e');
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.pink.shade200,
            constraints: const BoxConstraints.expand(),
            margin: EdgeInsets.all(convert ?? 50),
            child: Column(
              children: [
                Text('Latitude: $latitude'),
                Text('Longitude: $longitude'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
