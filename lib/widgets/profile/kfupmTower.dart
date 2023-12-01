import 'package:flutter/material.dart';

class KFUPMTower extends StatelessWidget {
  final Widget widget;
  final double height;
  const KFUPMTower({super.key, required this.widget, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/kfupm_tower.jpeg',
            ),
          ),
        ),
        height: height,
      ),
      Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.white,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              const Color.fromARGB(255, 106, 106, 106).withOpacity(0.1),
              const Color.fromARGB(255, 34, 34, 34).withOpacity(0.85),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
      ),
      widget
    ]);
  }
}
