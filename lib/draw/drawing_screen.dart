import 'package:body_ocean/draw/dot_info.dart';
import 'package:body_ocean/draw/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  @override
  Widget build(BuildContext context) {
    var pv = Provider.of<DrawingProvider>(context);

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              CustomPaint(
                painter: Painter(pv.lines),
              ),
              GestureDetector(
                onPanStart: (s) {
                  pv.drawStart(s.localPosition);
                },
                onPanUpdate: (s) {
                  pv.drawing(s.localPosition);
                },
              ),
            ]
          )
        )
      ],
    ));
  }
}

class Painter extends CustomPainter {
  Painter(this.lines);

  final List<List<DotInfo>> lines;

  @override
  void paint(Canvas canvas, Size size) {
    var myPaint = Paint()
    ..color = Colors.orange
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

    for(var oneLine in lines){
      var l = <Offset>[];
      var p = Path();
      for(var oneDot in oneLine){
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(p, myPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
