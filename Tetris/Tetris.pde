  Background back;
  int level;
  int score;
  Block current;
  boolean hasBlock = false;
  char[] types = { 'T', 'I', 'S', 'Z', 'J', 'L', 'O' };
  
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    back = new Background(30, 10, 20);
    //back.makeBackground();
  }
  
  void draw() {
    int counter = 0;   // counter is the number of rows cleared by the last block
    if(!hasBlock) {
      current = new Block(types[(int) Math.random()*7]);
      hasBlock = true;
    }

    back.isRowFilled(0);
    
    // score and level calculator
    if (counter == 1) score += 40*((int)(level+1));
    else if (counter == 2) score += 100*((int)(level+1));
    else if (counter == 3) score += 300*((int)(level+1));
    else if (counter == 4) score += 1200*((int)(level+1));
    level += 0.1*counter;
    
    fill(255);
    textSize(30);
    if (score < 10) text("000000"+score, 8, 25);
    else if (score < 100) text("00000"+score, 8, 25);
    else if (score < 1000) text("0000"+score, 8, 25);
    else if (score < 10000) text("000"+score, 8, 25);
    else if (score < 100000) text("00"+score, 8, 25); 
    else if (score < 1000000) text("0"+score, 8, 25);
    else text(""+score, 8, 25);
    textSize(10);
    text("Level "+level, 11, 37);
    
    noFill();
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
