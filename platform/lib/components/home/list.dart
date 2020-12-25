import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform/components/demo/know_%20canvas.dart';
import 'package:platform/components/demo/know_canvas_safe_area.dart';
import 'package:platform/components/demo/know_paint.dart';
import 'package:platform/components/demo/line.dart';
import 'package:platform/components/demo/paper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State createState() => MyHomePageState();
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>['画圆', '画线', '横屏画笔', '画布基础', 'test'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200];

  // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  tappedMenuClick(index, entries);
                },
                child: Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                ),
              );
            }),
      ),
    );
  }
}

class Controller extends GetxController {
  void pop() {
    //竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //全屏显示
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}

//actions
void tappedMenuClick(int index, List<String> entries) {
  print(index);
  if (index == 0) {
    Color color = Color(0xFFFFFFFF);
    Get.to(Paper(title: entries[index], color: color));
  } else if (index == 1) {
    Get.to(LinePaper(title: entries[index]));
  } else if (index == 2) {
    Get.to(KnowPaintPaper());
  } else if (index == 3) {
    Get.to(KnowCanvasPaper());
  } else if (index == 4) {
    Get.to(KnowCanvasTestPaper());
  }
}
