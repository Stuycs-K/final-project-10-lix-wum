  Background back;
  Block current;
  boolean hasBlock = false;
  char[] types = { 'T', 'I', 'S', 'Z', 'J', 'L', 'O' }
  
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    back = new Background(30, 10, 20);
    //back.makeBackground();
  }
  
  void draw() {
    if(!hasBlock) {
      current = new Block(types[(int) Math.random()*7]);
      hasBlock = true;
    }
    back.isRowFilled(0);
    displayGrid(back);
  }
  
  void displayGrid(Background game) {
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNERS);
    int size = back.size;
    for(int i = 0; i < back.game.length; i++) {
      for(int j = 0; j < back.game[i].length; j++) {
        if(back.game[i][j] == 'B') {
          fill(40);
        } else if(back.game[i][j] == 'T') {
          fill(153, 51, 255);
        } else if(back.game[i][j] == 'I') {
          fill(51, 204, 255);
        } else if(back.game[i][j] == 'S') {
          fill(51, 204, 51);
        } else if(back.game[i][j] == 'Z') {
          fill(204, 0, 0);
        } else if(back.game[i][j] == 'J') {
          fill(0, 51, 204);
        } else if(back.game[i][j] == 'L') {
          fill(255, 153, 51);
        } else if(back.game[i][j] == 'O') {
          fill(255, 214, 51);
        } else {
          fill(40);
        }
        rect((height/2 - 5*size) + i*size, (width/2 - 10*size) + j*size, (height/2 - 5*size) + (i+1)*size, (width/2 - 10*size) + (j+1)*size);
      }
    }
    //outside box
    strokeWeight(2);
    stroke(255);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 600);
  }
