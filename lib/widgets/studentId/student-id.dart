import 'dart:math';

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class StudentId extends StatelessWidget {
  const StudentId({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.bloodType,
    required this.birthDate,
    required this.expireDate,
  });

  final String imageUrl;
  final String name;
  final String id;
  final String bloodType;
  final String birthDate;
  final String expireDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.6 * MediaQuery.of(context).size.height,
      width: 0.9 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Transform.rotate(
        angle: pi / 2,
        child: SvgPicture.asset("assets/StudentCard.svg",
            fit: BoxFit.contain, width: 400),
      ),
    );
  }
}
