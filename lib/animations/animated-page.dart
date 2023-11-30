import 'package:flutter/material.dart';
import 'package:mefa8/const.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key, required this.child});
  final Widget child;

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
        Transform(
          origin: Offset(width / 2, height / 2),
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..scale(1.0 - (_animation.value * 0.2))
            ..translate(_animation.value * 80.0, 0, 0.0)
            ..rotateY(_animation.value * 0.5),
          child: GestureDetector(
            onTap: () {
              if (_animation.value < 1) {
                _controller.forward();
                return;
              }
              _controller.reverse();
            },
            child: Container(
              alignment: Alignment.center,
              height: height,
              width: width,
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
              child: widget.child,
            ),
          ),
        )
      ],
    );
  }
}

