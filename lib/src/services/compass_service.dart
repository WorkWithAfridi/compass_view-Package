// lib/view_models/compass_view_model.dart

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassService {
  final StreamController<double?> _directionController = StreamController.broadcast();
  StreamSubscription? _compassSubscription;

  Stream<double?> get directionStream => _directionController.stream;

  CompassService() {
    _initCompass();
  }

  void _initCompass() {
    try {
      _compassSubscription = FlutterCompass.events?.listen(
        (event) => _directionController.add(event.heading),
        onError: (e) {
          _directionController.addError('Compass sensor not available.');
        },
      );
    } on PlatformException {
      _directionController.addError('Platform does not support compass.');
    }
  }

  void dispose() {
    _compassSubscription?.cancel();
    _directionController.close();
  }
}
