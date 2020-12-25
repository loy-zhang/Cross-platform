import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class LinePaper extends StatefulWidget {
  LinePaper({String title = ""}) : this.title = title;
  final String title;
  @override
  LinePaperState createState() => LinePaperState();
}

class LinePaperState extends State<LinePaper> {
  @override
  void initState() {
    //竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //全屏显示
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Text(widget.title),
      ),
      body: Container(
        child: CustomPaint(
          painter: PaperPainter(),
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  Paint _paint;
  Path _path;

  PaperPainter() {
    _paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    canvas.drawLine(Offset(100, 0), Offset(100, 100), _paint);

    // _path.moveTo(200, 100);
    // _path.lineTo(200, 800);
    canvas.drawPath(_path, _paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
