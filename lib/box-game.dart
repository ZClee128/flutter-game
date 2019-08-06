import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  Size screenSize;
  bool hasWon = false;
  @override
  void render(Canvas canvas) {
    // TODO: 实现渲染
    // 在整个屏幕上绘制黑色背景
    //  声明了一个与屏幕一样大小的矩形（Rect）
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    //  声明一个绘制（Paint）类对象
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // 画一个盒子，如果获胜则将其设为绿色，否则为白色
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect =
        Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    }else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {
    // TODO: 实现更新
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    // 处理点击
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      hasWon = true;
    }
  }
}
