import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String appId = '332d812e1d37c97c993e85b8de285cb8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LocationScreen(weatherData)),
        (Route<dynamic> route) => false);

    // print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
      )),
    );
  }
}
