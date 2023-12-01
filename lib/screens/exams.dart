import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(Const.primaryGreen),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(Const.primaryGreen),
            Color(Const.darkGreen),
          ],
        ),
      ),
    );
  }
}
