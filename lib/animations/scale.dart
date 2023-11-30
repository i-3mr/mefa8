import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  ScaleAnimation({super.key, required this.child, required this.onTap});
  final Widget child;
  final AnimationScaleNotifier _scaleNotifier = AnimationScaleNotifier();
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // test
      onTapDown: (details) => _scaleNotifier.change(true),
      onTapUp: (details) => _scaleNotifier.change(false),
      onTapCancel: () => _scaleNotifier.change(false),
      onTap: onTap,
      child: AnimatedBuilder(
        animation: _scaleNotifier,
        builder: (context, _) => AnimatedScale(
          scale: _scaleNotifier.value ? 0.95 : 1,
          duration: const Duration(milliseconds: 300),
          child: child,
        ),
      ),
    );
  }
}

class AnimationScaleNotifier extends ChangeNotifier {
  bool value = false;

  change(bool val) {
    value = val;
    notifyListeners();
  }
}
