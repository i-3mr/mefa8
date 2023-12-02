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
      height: 0.33 * width,
      width: 0.85 * width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(Const.primaryGreen),
            Color(Const.darkGreen),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 0.2 * width,
                width: 0.2 * width,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ], borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.directions_bus,
                  size: 50,
                  color: Color(Const.primaryGreen),
                ),
              ),
              // as a divider
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 0.2 * width,
                width: 1,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                busStation,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Countdown(
                seconds: time,
                build: (BuildContext context, double time) {
                  if ((time / 60).toInt() == 0) {
                    return const Text(
                      ' الحافلة وصلت',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    );
                  }
                  return Row(
                    children: [
                      const Text(
                        'د',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                      Text(
                        '${(time / 60).toInt()} :',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'المتبقي للوصول ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
