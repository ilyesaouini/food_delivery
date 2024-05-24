import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
   Widget build(BuildContext context) {
    return MirrorAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0), // value for offset x-coordinate
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutSine, // non-linear animation
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0), // use animated value for x-coordinate
          child: child,
        );
      },
      child: Container(
        
        child: child,
      ),
    );
  }
}
