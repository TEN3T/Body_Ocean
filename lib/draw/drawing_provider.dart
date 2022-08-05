import 'package:body_ocean/draw/dot_info.dart';
import 'package:flutter/material.dart';

class DrawingProvider extends ChangeNotifier {

  final lines = <List<DotInfo>>[];
  Color _color = Colors.black;
  Color get color => _color;
  set changeColor(Color color){
    _color = color;
    notifyListeners();
  }

  void drawStart(Offset offset){
    var oneLine = <DotInfo>[];
    oneLine.add(DotInfo(offset, color));
    lines.add(oneLine);
    notifyListeners();
  }

  void drawing(Offset offset){
    lines.last.add(DotInfo(offset, color));
    notifyListeners();
  }

}