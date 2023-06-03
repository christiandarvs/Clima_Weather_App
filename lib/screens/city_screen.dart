import 'package:clima_app/utilities/constant.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/city_background.jpg'),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  cityName = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: kTextFieldDecoration,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: const Text('Get Weather'))
            ],
          ),
        ),
      ),
    );
  }
}
