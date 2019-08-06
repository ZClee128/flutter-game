import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:game/hit-game.dart';

class Backyard {
  final HitGame _hitGame;
  Sprite _sprite;
  Rect bgRect;

  Backyard(this._hitGame){
    _sprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      _hitGame.screenSize.height - (_hitGame.tileSize * 23),
      _hitGame.tileSize * 9,
      _hitGame.tileSize * 23,
    );
  }

  void render(Canvas canvas) {
    _sprite.renderRect(canvas, bgRect);
  }

  void update(double t) {}
}