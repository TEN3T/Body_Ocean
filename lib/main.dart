import 'package:body_ocean/draw/drawing_provider.dart';
import 'package:body_ocean/draw/drawing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => DrawingProvider(),
        child: DrawingScreen()
      ),
    ),
  );
}
