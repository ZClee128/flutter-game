import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'fly.dart';
import 'package:game/hit-game.dart';

class DroolerFly extends Fly {
  double get speed => hitGame.tileSize * 1.5;
  DroolerFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flying = List<Sprite>();
    flying.add(Sprite('flies/drooler-fly-1.png'));
    flying.add(Sprite('flies/drooler-fly-2.png'));
    deadFly = Sprite('flies/drooler-fly-dead.png');
  }
}