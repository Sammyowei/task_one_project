import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;
  final int? duration;
  CustomPageRoute({
    this.duration,
    required this.child,
  });
  @override
  Color? get barrierColor => Colors.black;
  @override
  String? get barrierLabel => '';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: duration ?? 1000);
}
