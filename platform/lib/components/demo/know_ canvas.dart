import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform/config/platform_static.dart';

class KnowCanvasPaper extends StatefulWidget {
  @override
  KnowCanvasPaperState createState() => KnowCanvasPaperState();
}

class KnowCanvasPaperState extends State<KnowCanvasPaper> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    print("topPaddingtopPaddingtopPadding");
    print(topPadding);
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("画布基础"),
          ),
          preferredSize: Size.fromHeight(PlatformStatic.appbar)),
      body: Container(
          width: size.width,
          height: size.height,
          child: SafeArea(
              child: CustomPaint(
            painter: PaperPainter(
                topPadding: topPadding, bottomPadding: bottomPadding),
          ))),
    );
  }
}

class PaperPainter extends CustomPainter {
  PaperPainter({double topPadding, double bottomPadding})
      : this.topPadding = topPadding,
        this.bottomPadding = bottomPadding;
  final double topPadding;
  final double bottomPadding;

  void drawGrid(Canvas canvas, Size size) {
    //网格
    //缩放变换
    Paint _gridPint;
    final double step = 20; //格子边长
    final double strokeWidth = 0.5; //线宽
    final Color color = Colors.grey;
    _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;

    for (var i = 0; i < size.width / 20; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height), _gridPint);
      //竖线
      canvas.translate(step, 0);
    }
    canvas.restore();

    canvas.save();
    print(Size.fromHeight(size.height));
    print(size.height);
    for (var i = 0; i < size.height / 20; i++) {
      //横线
      canvas.translate(0, step);
      canvas.drawLine(
          Offset(0, PlatformStatic.appbar + topPadding - 20),
          Offset(size.width, PlatformStatic.appbar + topPadding - 20),
          _gridPint);
    }
    canvas.restore();
    canvas.save();
  }

  void drawSun(Canvas canvas, Size size) {
    //平移变换
    canvas.translate(size.width * 0.5, size.height * 0.5);
    final int count = 12;
    var paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    canvas.save();
    var stepC = 2 * pi / count;
    canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
    canvas.rotate(stepC);
    canvas.restore();
    canvas.save();
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawSun(canvas, size);
    canvas.restore();
    canvas.drawCircle(
        Offset(0, 0),
        50,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
