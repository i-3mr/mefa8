import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mefa8/const.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BusTrackerComponent extends StatelessWidget {
  const BusTrackerComponent({
    super.key,
    required this.busStation,
  });

  final String busStation;

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
          CircularPercentIndicator(
            backgroundColor: Color(Const.lightGreen),
            radius: 30.0,
            lineWidth: 8.0,
            animation: true,
            percent: 0.7,
            center: Text(
              "70.0%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Color(Const.primaryGreen),
          )
        ],
      ),
    );
  }
}
