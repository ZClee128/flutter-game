import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:game/components/agile-fly.dart';
import 'package:game/components/backyard.dart';
import 'package:game/components/drooler-fly.dart';
import 'package:game/components/fly.dart';
import 'package:flutter/gestures.dart';
import 'package:game/components/hungry-fly.dart';
import 'package:game/components/macho-fly.dart';
import 'package:game/components/mosquito-fly.dart';
import 'package:game/components/start-button.dart';
import 'package:game/view.dart';
import 'package:game/views/home-view.dart';

class HitGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> enemy;
  Random rnd;
  Backyard _backyard;

  View activeView = View.home;
  HomeView homeView;
  StartButton startButton;
  HitGame() {    
    initialize();    
  }

  void initialize() async {
    enemy = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    homeView = HomeView(this);
    _backyard = Backyard(this);
    startButton = StartButton(this);
    produceFly();
  }

  @override
  void render(Canvas canvas) {
    // 添加游戏背景
    // Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    // Paint bgPaint = Paint();
    // bgPaint.color = Color(0xff576574);
    // canvas.drawRect(bgRect, bgPaint);
    _backyard.render(canvas);
    enemy.forEach((Fly fly) => fly.render(canvas));
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
      homeView.render(canvas);
    }
  }

  @override
  void update(double t) {
    enemy.forEach((Fly fly) => fly.update(t));
    enemy.removeWhere((Fly fly) => fly.isOffScreen);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void produceFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    // enemy.add(Fly(this,x,y));
    switch (rnd.nextInt(5)) {
      case 0:
        enemy.add(MosquitoFly(this, x, y));
        break;
      case 1:
        enemy.add(DroolerFly(this, x, y));
        break;
      case 2:
        enemy.add(AgileFly(this, x, y));
        break;
      case 3:
        enemy.add(MachoFly(this, x, y));
        break;
      case 4:
        enemy.add(HungryFly(this, x, y));
        break;
    }
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    if (!isHandled) {
      enemy.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
        }
      });
    }
  }
}
