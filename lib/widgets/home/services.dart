import 'package:flutter/material.dart';
import 'package:mefa8/animations/scale.dart';
import 'package:mefa8/widgets/home/service.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          ScaleAnimation(child: Service(title: "test"), onTap: () {}),
          ScaleAnimation(child: Service(title: "test"), onTap: () {}),
          ScaleAnimation(child: Service(title: "test"), onTap: () {}),
          ScaleAnimation(child: Service(title: "test"), onTap: () {}),
        ],
      ),
    );
  }
}
