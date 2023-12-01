import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';
import 'package:svg_flutter/svg.dart';

class StudentId extends StatelessWidget {
  const StudentId({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.birthDate,
    required this.expireDate,
    required this.nationalId,
  });

  final String imageUrl;
  final String name;
  final String id;
  final String birthDate;
  final String expireDate;
  final String nationalId;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    return Container(
      // padding: EdgeInsets.only(top: 0.2 * height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/StudentCard.svg",
            width: 0.6 * height,
          ),
          Positioned(
            top: 0.1 * height,
            left: 0.020 * height,
            child: Container(
              height: 0.14 * height,
              width: 0.14 * height,
              // color: Colors.red,
              child: Image(
                image: Image.network(imageUrl).image,
              ),
            ),
          ),
          Positioned(
            top: 0.245 * height,
            left: 0.04 * height,
            child: Text(
              id,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(
                  Const.darkGreen,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.022 * height,
            top: 0.1 * height,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 44, 44),
              ),
            ),
          ),
          Positioned(
            right: 0.022 * height,
            top: 0.14 * height,
            child: Container(
              width: 0.555 * width,
              height: 1,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 200, 242, 199)),
            ),
          ),
          Positioned(
            right: 0.1 * height,
            top: 0.14 * height,
            child: Container(
              height: 0.215 * width,
              width: 1,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 200, 242, 199)),
            ),
          ),
          Positioned(
            right: 0.022 * height,
            top: 0.19 * height,
            child: Container(
              width: 0.555 * width,
              height: 1,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 200, 242, 199)),
            ),
          ),
          Positioned(
            child: Text("السجل المدني"),
            right: 0.022 * height,
            top: 0.152 * height,
          ),
          Positioned(
            child: Text(nationalId),
            right: 0.15 * height,
            top: 0.154 * height,
          ),
          Positioned(
            child: Text("تاريخ الميلاد"),
            right: 0.022 * height,
            top: 0.205 * height,
          ),
          Positioned(
            child: Text(birthDate),
            right: 0.15 * height,
            top: 0.205 * height,
          ),
          Positioned(
            right: 0.12 * height,
            top: 0.2465 * height,
            child: const Text(
              "صالحة لغاية",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Positioned(
            right: 0.19 * height,
            top: 0.2465 * height,
            child: Text(
              expireDate,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
