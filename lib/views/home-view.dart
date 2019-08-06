import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:game/hit-game.dart';

class HomeView {
  final HitGame hitGame;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.hitGame){
    titleRect = Rect.fromLTWH(
      hitGame.tileSize,
      (hitGame.screenSize.height / 2) - (hitGame.tileSize * 4),
      hitGame.tileSize * 7,
      hitGame.tileSize * 4,
    );
    titleSprite = Sprite('branding/title.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}