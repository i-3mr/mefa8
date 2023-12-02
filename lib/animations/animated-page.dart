import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key, required this.child, required this.backWidget});
  final Widget child;
  final Widget backWidget;

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with SingleTickerProviderStateMixin {
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: widget.backWidget,
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
            child: widget.child,
          ),
        )
      ],
    );
  }
}
