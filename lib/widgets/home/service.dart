import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mefa8/const.dart';

class Service extends StatelessWidget {
  const Service({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.mapPin,
                color: Color(Const.primaryGreen),
              )
            ],
          ),
        ],
      ),
    );
  }
}
