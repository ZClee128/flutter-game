import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'fly.dart';
import 'package:game/hit-game.dart';

class HungryFly extends Fly {
  HungryFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flying = List<Sprite>();
    flying.add(Sprite('flies/hungry-fly-1.png'));
    flying.add(Sprite('flies/hungry-fly-2.png'));
    deadFly = Sprite('flies/hungry-fly-dead.png');
  }
}