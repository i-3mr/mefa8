import 'package:flutter/material.dart';
import 'package:mefa8/animations/animated-page.dart';
import 'package:mefa8/const.dart';
import 'package:mefa8/widgets/home/index.dart';
import 'package:mefa8/widgets/home/services.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 390),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedPage(
          child: SafeArea(
        child: Column(
          children: [
            Services()
          ],
        ),
      )
      ),
    );
  }
}
