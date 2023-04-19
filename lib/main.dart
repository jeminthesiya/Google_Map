import 'package:flutter/material.dart';
import 'package:google_map/location/view/homeScreen.dart';
import 'package:google_map/map/view/map.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/':(context) => DataScreen(),
       'map':(context) => HomeScreen(),
      },
    ),
  );
}
