import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mefa8/const.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer_count_down/timer_count_down.dart';

class BusTrackerComponent extends StatelessWidget {
  const BusTrackerComponent({
    super.key,
    required this.busStation,
    required this.time,
  });

  final String busStation;
  final int time;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 0.3 * width,
      width: 0.85 * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(57, 115, 115, 115),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.directions_bus,
            size: 50,
            color: Color(Const.primaryGreen),
          ),
          Text(
            busStation,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'الوقت المتبقي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                  color: Color(0x9F8A8A8A),
                ),
              ),
              Countdown(
                  seconds: time,
                  build: (BuildContext context, double time) {
                    if ((time / 60).toInt() == 0) {
                      return Text(
                        ' الحافلة وصلت',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      );
                    }
                    return Text(
                      ' د' + (time / 60).toInt().toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
