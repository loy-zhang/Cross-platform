import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:platform/components/home/list.dart';
import 'package:get/get.dart';

class KnowPaintPaper extends StatefulWidget {
  @override
  KnowPaintPaperState createState() => KnowPaintPaperState();
}

class KnowPaintPaperState extends State<KnowPaintPaper> {
  void initState() {
    //横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //全屏显示
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("横屏画笔🖌️"),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              c.pop();
              Navigator.pop(context);
            },
          )),
      body: Container(
        child: CustomPaint(
          painter: PaperPainter(),
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    canvas.drawCircle(
        Offset(170, 180),
        170,
        paint
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);

    canvas.drawCircle(
        Offset(170 + 360.0, 180),
        170,
        paint
          ..isAntiAlias = false //抗锯齿
          ..style = PaintingStyle.fill
          ..color = Colors.red
          ..invertColors = true); //是否反色
    //1. 线帽类型strokeCap
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 20;
    canvas.drawLine(
        Offset(720, 50), Offset(720, 150), paint..strokeCap = StrokeCap.butt);
    canvas.drawLine(Offset(720 + 50.0, 50), Offset(720 + 50.0, 150),
        paint..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(720 + 50.0 * 2, 50), Offset(720 + 50.0 * 2, 150),
        paint..strokeCap = StrokeCap.square);

    //2. 线接类型strokeJoin
    Path path = Path();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.pink
      ..strokeWidth = 20;

    path.moveTo(720, 160);
    path.lineTo(720, 220);
    path.relativeLineTo(800, 160);
    path.relativeLineTo(720, 300);

    path.moveTo(50, 50);
    path.lineTo(50, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.bevel);

    path.reset();
    path.moveTo(50 + 150.0, 50);
    path.lineTo(50 + 150.0, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.miter);

    path.reset();
    path.moveTo(50 + 150.0 * 2, 50);
    path.lineTo(50 + 150.0 * 2, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.round);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
