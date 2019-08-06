import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:game/hit-game.dart';
import 'package:game/view.dart';

class StartButton {
  final HitGame hitGame;
  Rect rect;
  Sprite sprite;

  StartButton(this.hitGame) {
    rect = Rect.fromLTWH(
      hitGame.tileSize * 1.5,
      (hitGame.screenSize.height * .75) - (hitGame.tileSize * 1.5),
      hitGame.tileSize * 6,
      hitGame.tileSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    hitGame.activeView = View.playing;
  }
}