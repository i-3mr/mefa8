import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Row(),
        ],
      ),
    );
  }
}
