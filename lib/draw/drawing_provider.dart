import 'package:body_ocean/draw/dot_info.dart';
import 'package:flutter/material.dart';

class DrawingProvider extends ChangeNotifier {

  final lines = <List<DotInfo>>[];

  void drawStart(Offset offset){
    var oneLine = <DotInfo>[];
    oneLine.add(DotInfo(offset));
    lines.add(oneLine);
    notifyListeners();
  }

  void drawing(Offset offset){
    lines.last.add(DotInfo(offset));
    notifyListeners();
  }

}