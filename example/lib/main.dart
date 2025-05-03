import 'package:compass_view/compass_view.dart'; // ← Your package
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compass Example',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const CompassHomePage(),
    );
  }
}

class CompassHomePage extends StatelessWidget {
  const CompassHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compass View', style: TextStyle(color: Colors.white)), backgroundColor: Colors.black),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CompassWidget(
              size: 100,
              backgroundColor: Colors.white,
              showPointer: false,
              markerColor: Colors.black,
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),

            CompassWidget(
              size: 300,
              backgroundColor: Colors.white,
              markerColor: Colors.black,
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            CompassHeading(textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
