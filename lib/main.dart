import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/gps_home_screen.dart';

void main() {
  runApp(const GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GpsHomeScreen(),
    );
  }
}
