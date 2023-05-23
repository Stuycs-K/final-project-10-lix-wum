  Background game;
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    game = new Background(30, 10, 20);
    game.makeBackground();
  }
  
  void draw() {
    game.isRowFilled(0);
  }
