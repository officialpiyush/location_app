import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:locationapp/widgets/location_page.dart';

class LocationPageState extends State<LocationPage> {
  Location location = Location();
  Map<String, double> currentLocation;

  @override
  void initState() {
    super.initState();

    location.onLocationChanged().listen((data) {
      setState(() {
        currentLocation = data;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Coordinates:',
              style: Theme.of(context).textTheme.display1,
            ),
             currentLocation == null
              ? CircularProgressIndicator()
              : Text("\n (" + currentLocation["latitude"].toString() + " , " + currentLocation["longitude"].toString() + ")")
          ],
        ),
      ),
    );
  }
}