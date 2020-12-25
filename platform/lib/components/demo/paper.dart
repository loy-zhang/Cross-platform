import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';

class Paper extends StatelessWidget {
  Paper(
      {String title = "Testing",
      Color color = const Color(0xFFFFFFFF),
      String result})
      : this.title = title,
        this.color = color,
        this.result = result;

  final String title;
  final Color color;
  final String result;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        // backgroundColor: color,
        appBar: AppBar(
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                if (result == null) {
                  /// You can use [Navigator.pop]
                  Navigator.pop(context);
                } else {
                  /// Or [FluroRouter.pop]
                  FluroRouter.appRouter.pop(context, result);
                }
              }),
          title: Text(title),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            color: Colors.red,
            child: CustomPaint(
              painter: PaperPainter(),
            )));
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //创建画笔
    final Paint paint = Paint();
    // 绘制圆
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
