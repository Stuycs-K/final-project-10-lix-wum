  Background back;
  int level;
  int score;
  Block current;
  public static boolean hasBlock = false;
  char[] types = { 'T', 'I', 'S', 'Z', 'J', 'L', 'O' };
  
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    back = new Background(30, 20, 10);
    //back.makeBackground();
  }
  
  void keyPressed() {
    if(key == 'd' || key == 'x') {
      current.rotateRight(back);
    }
    if(key == 'a' || key == 'z') {
      current.rotateLeft(back);
    }
    if(key == 'l' || keyCode == RIGHT) {
      current.moveRight(back);
    }
     if(key == 'j' || keyCode == LEFT) {
      current.moveLeft(back);
    }
    if(key == 'k' || keyCode == DOWN) {
      current.moveDown(back);
    }
    if(key == ' ') {
      current.fastDrop(back);
    } 
  }
  
  void draw() {
    int counter = 0;   // counter is the number of rows cleared by the last block
    if(!hasBlock) {
      current = new Block(types[(int) (Math.random()*7)]);\
      current.moveUp();
      current.moveRight();
      current.moveRight();
      current.moveRight();
      hasBlock = true;
    }

    back.isRowFilled(0);
    
    // score and level calculator
    if (counter == 1) score += 40*((int)(level+1));
    else if (counter == 2) score += 100*((int)(level+1));
    else if (counter == 3) score += 300*((int)(level+1));
    else if (counter == 4) score += 1200*((int)(level+1));
    level += 0.1*counter;
    
    // level indicator
    fill(255);
    textSize(30);
    if (score < 10) text("000000"+score, 8, 30);
    else if (score < 100) text("00000"+score, 8, 30);
    else if (score < 1000) text("0000"+score, 8, 30);
    else if (score < 10000) text("000"+score, 8, 30);
    else if (score < 100000) text("00"+score, 8, 30); 
    else if (score < 1000000) text("0"+score, 8, 30);
    else text(""+score, 8, 30);
    textSize(15);
    text("Level "+level, 9, 45);
    
    noFill();
    displayGrid(back);
    displayBlock(current);
  }
  
  void displayGrid(Background game) {
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
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
        rect((width/2 - 5*size) + j*size, (height/2 - 10*size) + i*size, size, size);
      }
    }
    //outside box
    strokeWeight(2);
    stroke(255);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 600);
  }
  
  void displayBlock (Block current) {
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int x = 0; x < current.blocks[current.rotation].length; x++) {
      int i = current.blocks[current.rotation][x][0];
      int j = current.blocks[current.rotation][x][1];
      if(current.type == 'B') {
          fill(40);
        } else if(current.type == 'T') {
          fill(153, 51, 255);
        } else if(current.type == 'I') {
          fill(51, 204, 255);
        } else if(current.type == 'S') {
          fill(51, 204, 51);
        } else if(current.type == 'Z') {
          fill(204, 0, 0);
        } else if(current.type == 'J') {
          fill(0, 51, 204);
        } else if(current.type == 'L') {
          fill(255, 153, 51);
        } else if(current.type == 'O') {
          fill(255, 214, 51);
        } else {
          fill(40);
        }
       rect((width/2 - 5*size) + j*size, (height/2 - 10*size) + i*size, size, size);
    }
  }
