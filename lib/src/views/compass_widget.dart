// lib/src/compass_widget.dart

import 'dart:math' as math;

import 'package:compass_view/src/services/compass_service.dart';
import 'package:compass_view/src/views/compass_painter.dart';
import 'package:flutter/material.dart';

class CompassWidget extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color markerColor;
  final TextStyle textStyle;
  final bool showPointer;

  const CompassWidget({
    super.key,
    this.size = 250,
    this.showPointer = true,
    this.backgroundColor = Colors.white,
    this.markerColor = Colors.red,
    this.textStyle = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
  });

  @override
  State<CompassWidget> createState() => _CompassWidgetState();
}

class _CompassWidgetState extends State<CompassWidget> {
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double?>(
      stream: _compassService.directionStream,
      builder: (context, snapshot) {
        final heading = snapshot.data ?? 0;

        return Stack(
          children: [
            Transform.rotate(
              angle: -(heading * (math.pi / 180)),
              child: CustomPaint(
                size: Size(widget.size, widget.size),
                painter: CustomCompassPainter(
                  size: widget.size,
                  backgroundColor: widget.backgroundColor,
                  markerColor: widget.markerColor,
                  textStyle: widget.textStyle,
                ),
              ),
            ),
            widget.showPointer
                ? Container(
                  height: widget.size / 3,
                  width: widget.size,
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 3,
                    height: widget.size / 2,
                    decoration: BoxDecoration(color: widget.markerColor, borderRadius: BorderRadius.circular(2)),
                  ),
                )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
