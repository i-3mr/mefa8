import 'package:flutter/material.dart';
import 'package:mefa8/animations/animated-page.dart';
import 'package:mefa8/widgets/home/index.dart';
import 'package:mefa8/widgets/home/services.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedPage(
          child: SafeArea(
        child: Column(
          children: [
            Services(),
            Spacer(),
            SizedBox(
              height: 100,
              child: BottomNavBar(index: 0),
            )
          ],
        ),
      )),
    );
  }
}
