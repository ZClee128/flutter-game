import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'fly.dart';
import 'package:game/hit-game.dart';

class MosquitoFly extends Fly {
  MosquitoFly(HitGame game, double x, double y) : super(game){
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flying = List<Sprite>();
    flying.add(Sprite('flies/mosquito-fly-1.png'));
    flying.add(Sprite('flies/mosquito-fly-2.png'));
    deadFly = Sprite('flies/mosquito-fly-dead.png');
  }
}