import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform/config/platform_static.dart';

class KnowCanvasTestPaper extends StatefulWidget {
  @override
  KnowCanvasTestPaperState createState() => KnowCanvasTestPaperState();
}

class KnowCanvasTestPaperState extends State<KnowCanvasTestPaper> {
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
            title: Text("test"),
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
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    // canvas.translate(size.width * 0, size.height * 0);
    canvas.drawLine(
        Offset(0, 0),
        Offset(0, 10),
        paint
          ..color = Colors.red
          ..strokeWidth = 15
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.fill);
    canvas.translate(size.width * 0, size.height * 0);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 50, paint);
    //平移变换
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
