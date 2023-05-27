import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<String?> getWeather(double lat, double long) async {
  try {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=057e14416124ad6da322d52d049ae9d7'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final weather = jsonData['weather'][0]['main'];
      debugPrint('$weather');
    } else {
      return null;
    }
  } catch (e) {
    debugPrint('Error: $e');
    return null;
  }
  return null;
}
