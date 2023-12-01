import 'package:flutter/material.dart';
import 'package:mefa8/animations/animated-page.dart';
import 'package:mefa8/widgets/home/index.dart';
import 'package:mefa8/widgets/home/services.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedPage(
          child: SafeArea(
        child: Column(
          children: [
            const ProfileHeader(
                name: "عبدالله حجازي",
                imageUrl:
                    "https://avatars.githubusercontent.com/u/17090794?v=4"),
            const Expanded(
              child: Services(),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: const BottomNavBar(index: 0),
            )
          ],
        ),
      )),
    );
  }
}
