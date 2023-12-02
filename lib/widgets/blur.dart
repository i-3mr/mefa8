import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';

class BlurBackGround extends StatelessWidget {
  const BlurBackGround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(Const.primaryGreen),
                  spreadRadius: 1,
                  blurRadius: 90, // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(Const.primaryGreen),
                  spreadRadius: 1,
                  blurRadius: 120, // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
