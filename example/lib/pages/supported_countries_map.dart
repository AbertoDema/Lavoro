import 'dart:async';
import 'dart:convert';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';

class SupportedCountriesMap extends StatefulWidget {
  const SupportedCountriesMap({Key? key}) : super(key: key);

  @override
  _SupportedCountriesMapState createState() => _SupportedCountriesMapState();
}

class _SupportedCountriesMapState extends State<SupportedCountriesMap> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 1));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                '$minutes:$seconds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),
              InteractiveViewer(
                maxScale: 75.0,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.92,
                      // Actual widget from the Countries_world_map package.
                      child: SimpleMap(
                        instructions: SMapWorld.instructions,

                        // If the color of a country is not specified it will take in a default color.
                        defaultColor: Colors.grey,
                        // CountryColors takes in 250 different colors that will color each country the color you want. In this example it generates a random color each time SetState({}) is called.
                        callback: (id, name, tapdetails) {},
                      ),
                    ),
                    // Creates 8% from right side so the map looks more centered.
                    Container(width: MediaQuery.of(context).size.width * 0.08),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: startTimer,
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: stopTimer,
                child: Text(
                  'Stop',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: resetTimer,
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
