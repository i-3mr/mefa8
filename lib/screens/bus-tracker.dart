import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/bus%20tracker/bus-tracker-component.dart';

class BusTracker extends StatelessWidget {
  const BusTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(Const.primaryGreen),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(Const.primaryGreen),
              Color(Const.darkGreen),
            ],
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              BusTrackerComponent(busStation: 'محطة البداية'),
              BusTrackerComponent(busStation: 'محطة البداية'),
              BusTrackerComponent(busStation: 'محطة البداية'),
              BusTrackerComponent(busStation: 'محطة البداية'),
              BusTrackerComponent(busStation: 'محطة البداية'),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
