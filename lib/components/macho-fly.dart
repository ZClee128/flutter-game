import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'fly.dart';
import 'package:game/hit-game.dart';

class MachoFly extends Fly {
   double get speed => hitGame.tileSize * 2.5;
  MachoFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flying = List<Sprite>();
    flying.add(Sprite('flies/macho-fly-1.png'));
    flying.add(Sprite('flies/macho-fly-2.png'));
    deadFly = Sprite('flies/macho-fly-dead.png');
  }
}