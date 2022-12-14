import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class AppPolygon extends StatelessWidget {
  const AppPolygon({super.key, required this.child, required this.radius});

  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final size = radius * 2;

    return Container(
      height: size + 2,
      width: size + 2,
      decoration: ShapeDecoration(
        color: scheme.outline.withOpacity(1 * 60 / radius),
        shape: PolygonShapeBorder(
          sides: 6,
          cornerRadius: 40.toPercentLength,
          cornerStyle: CornerStyle.rounded,
        ),
      ),
      child: Center(
        child: Container(
          height: size,
          width: size,
          decoration: ShapeDecoration(
            color: theme.scaffoldBackgroundColor,
            shape: PolygonShapeBorder(
              sides: 6,
              cornerRadius: 40.toPercentLength,
              cornerStyle: CornerStyle.rounded,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
