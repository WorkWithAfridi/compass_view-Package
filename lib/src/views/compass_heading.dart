// lib/src/compass_widget.dart

import 'package:compass_view/src/services/compass_service.dart';
import 'package:flutter/material.dart';

class CompassHeading extends StatefulWidget {
  final TextStyle textStyle;

  const CompassHeading({super.key, this.textStyle = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)});

  @override
  State<CompassHeading> createState() => _CompassHeadingState();
}

class _CompassHeadingState extends State<CompassHeading> {
  late final CompassService _compassService;

  @override
  void initState() {
    super.initState();
    _compassService = CompassService();
  }

  @override
  void dispose() {
    _compassService.dispose();
    super.dispose();
  }

  String getCardinalDirection(double degrees) {
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW', 'N'];
    final index = ((degrees + 22.5) ~/ 45) % 8;
    return directions[index];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double?>(
      stream: _compassService.directionStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error loading compass.');
        }

        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final heading = snapshot.data ?? 0.0;
        final direction = getCardinalDirection(heading);

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
          child: Text('${heading.toStringAsFixed(0)}° $direction', key: ValueKey('${heading.toStringAsFixed(0)}$direction'), style: widget.textStyle),
        );
      },
    );
  }
}
