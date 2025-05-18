import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GpsHomeScreen extends StatefulWidget {
  const GpsHomeScreen({super.key});

  @override
  State<GpsHomeScreen> createState() => _GpsHomeScreenState();
}

class _GpsHomeScreenState extends State<GpsHomeScreen> {
  LocationData? currentLocation;

  Future<void> _getCurrentLocation() async {
    // // TODO: Check if the app has permission
    // bool isPermissionEnabled = await _isLocationPermissionEnable();
    // if (isPermissionEnabled) {
    //   // TODO: Check if the GPS service On/Off
    //   bool isGpsServiceEnabled = await Location.instance.serviceEnabled();
    //   if (isGpsServiceEnabled) {
    //     // TODO: Get current location
    //     Location.instance.changeSettings(accuracy: LocationAccuracy.high);
    //     LocationData locationData = await Location.instance.getLocation();
    //     print(locationData);
    //     currentLocation = locationData;
    //     setState(() {});
    //   } else {
    //     // TODO: If not, then move to gps service settings
    //     Location.instance.requestService();
    //   }
    // } else {
    //   // TODO: If not, then request the permission
    //   bool isPermissionGranted = await _requestPermission();
    //   if (isPermissionGranted) {
    //     _getCurrentLocation();
    //   }
    // }
    _onLocationPermissionAndServiceEnabled(() async {
      LocationData locationData = await Location.instance.getLocation();
      print(locationData);
      currentLocation = locationData;
      setState(() {});
    });
  }

  Future<void> _listenCurrentLocation() async {
    // // TODO: Check if the app has permission
    // bool isPermissionEnabled = await _isLocationPermissionEnable();
    // if (isPermissionEnabled) {
    //   // TODO: Check if the GPS service On/Off
    //   bool isGpsServiceEnabled = await Location.instance.serviceEnabled();
    //   if (isGpsServiceEnabled) {
    //     // TODO: Get current location
    //     Location.instance.changeSettings(
    //         accuracy: LocationAccuracy.high, interval: 1000, distanceFilter: 3);
    //     Location.instance.onLocationChanged.listen((LocationData location) {
    //       print(location);
    //     });
    //   } else {
    //     // TODO: If not, then move to gps service settings
    //     Location.instance.requestService();
    //   }
    // } else {
    //   // TODO: If not, then request the permission
    //   bool isPermissionGranted = await _requestPermission();
    //   if (isPermissionGranted) {
    //     _listenCurrentLocation();
    //   }
    // }
    _onLocationPermissionAndServiceEnabled(() {
      Location.instance.changeSettings(
          accuracy: LocationAccuracy.high, interval: 1000, distanceFilter: 3);
      Location.instance.onLocationChanged.listen((LocationData location) {
        print(location);
      });
    });
  }

  Future<void> _onLocationPermissionAndServiceEnabled(VoidCallback onSuccess) async {
    // TODO: Check if the app has permission
    bool isPermissionEnabled = await _isLocationPermissionEnable();
    if (isPermissionEnabled) {
      // TODO: Check if the GPS service On/Off
      bool isGpsServiceEnabled = await Location.instance.serviceEnabled();
      if (isGpsServiceEnabled) {
        // TODO: what user want
        onSuccess();
      } else {
        // TODO: If not, then move to gps service settings
        Location.instance.requestService();
      }
    } else {
      // TODO: If not, then request the permission
      bool isPermissionGranted = await _requestPermission();
      if (isPermissionGranted) {
        _listenCurrentLocation();
      }
    }
  }

  Future<bool> _isLocationPermissionEnable() async {
    PermissionStatus locationPermission =
        await Location.instance.hasPermission();
    if (locationPermission == PermissionStatus.granted ||
        locationPermission == PermissionStatus.grantedLimited) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _requestPermission() async {
    PermissionStatus locationPermission =
        await Location.instance.requestPermission();
    if (locationPermission == PermissionStatus.granted ||
        locationPermission == PermissionStatus.grantedLimited) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS Service Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current location: ${currentLocation?.latitude},${currentLocation?.longitude}',
            ),
            TextButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: const Text('Get current location'),
            ),
            TextButton(
              onPressed: () {
                _listenCurrentLocation();
              },
              child: const Text('Listen current location'),
            )
          ],
        ),
      ),
    );
  }
}
