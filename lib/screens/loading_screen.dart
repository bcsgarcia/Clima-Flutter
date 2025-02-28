import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weatherModel = WeatherModel();

  final loading = SpinKitDoubleBounce(
    size: 100,
    color: Colors.grey,
  );

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: loading),
    );
  }
}
