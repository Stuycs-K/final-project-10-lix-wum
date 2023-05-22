public static final int size = 30;

void setup() {
  size(800, 800);
  Background();
}

public void Background () {
  rectMode(CENTER);
  rect(width/2, height/2, 300, 600);
  //stroke(220,220,220);
  for (int x = width/2-size*5; x < width/2+size*5; x+=size) {
    line(x, height/2-size*10, x, height/2+size*10);
  }
  for (int y = height/2-size*10; y < height/2+size*10; y+=size) {
    line(width/2-size*5, y, width/2+size*5, y);
  }
}
