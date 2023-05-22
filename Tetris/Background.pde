public static final int size = 30;

void setup() {
  size(800, 800);
  background(40, 40, 40);
  Background();
}

public void Background () {

  //inner lines
  stroke(220,220,220);
  strokeWeight(1);
  for (int x = width/2-size*4; x < width/2+size*5; x+=size) {
    line(x, height/2-size*10, x, height/2+size*10);
  }
  for (int y = height/2-size*9; y < height/2+size*10; y+=size) {
    line(width/2-size*5, y, width/2+size*5, y);
  }
  
  //outside box
  strokeWeight(2);
  stroke(255);
  fill(255, 0, 0, 0);
  rectMode(CENTER);
  rect(width/2, height/2, 300, 600);
  
}
