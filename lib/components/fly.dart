import 'dart:ui';

import 'package:game/hit-game.dart';
import 'package:flame/sprite.dart';

class Fly {
  final HitGame hitGame;
  Rect flyRect;

  List<Sprite> flying;
  Sprite deadFly;
  double flyingIndex = 0;
  bool isDead = false;
  bool isOffScreen = false;

  Offset targetLocation;

  double get speed => hitGame.tileSize*3;

  Fly(this.hitGame){
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = hitGame.rnd.nextDouble() *
        (hitGame.screenSize.width - (hitGame.tileSize * 2.025));
    double y = hitGame.rnd.nextDouble() *
        (hitGame.screenSize.height - (hitGame.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas canvas) {
    if (isDead) {
      deadFly.renderRect(canvas, flyRect.inflate(2));
    } else {
      flying[flyingIndex.toInt()].renderRect(canvas, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, hitGame.tileSize * 12 * t);
      if (flyRect.top > hitGame.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      flyingIndex += 30 * t;
      if (flyingIndex >= 2) {
        flyingIndex -= 2;
      }
      // 保存蚊子应该移动多少
      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  void onTapDown() {
    isDead = true;
    hitGame.produceFly();
  }
}
