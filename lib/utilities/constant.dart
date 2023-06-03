import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = '057e14416124ad6da322d52d049ae9d7';

final kTempTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 80);

final kMessageTextStyle = GoogleFonts.poppins(
    color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

final kTextFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    fillColor: Colors.white,
    hintText: 'Enter City Name',
    hintStyle: const TextStyle(color: Colors.grey),
    icon: const Icon(
      Icons.location_city_outlined,
      color: Colors.white,
      size: 30,
    ),
    filled: true);
