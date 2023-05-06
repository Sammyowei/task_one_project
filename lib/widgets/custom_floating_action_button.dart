import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomFAB extends ConsumerWidget {
  final Widget? child;
  final VoidCallback? ontap;
  final Color? color;
  final double? borderRadius;
  final double? height;
  final double? width;
  const CustomFAB({
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.ontap,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: ontap ??
          () {
            log('ontap botton has been clicked');
          },
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
        ),
        height: height ?? 50.0,
        width: width ?? 50.0,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
