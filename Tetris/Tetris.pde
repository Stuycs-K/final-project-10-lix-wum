  import java.util.ArrayDeque;
  import java.util.Deque;
  
  Background back;
  ArrayDeque<Block> next = new ArrayDeque<Block>(5);  
  int level;
  int score;
  Block current;
  public static boolean hasBlock = false;
  char[] types = { 'T', 'I', 'S', 'Z', 'J', 'L', 'O' };
  int savedTime;
  int totalTime = 1000;
  
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    back = new Background(30, 25, 14); //grid has a border of 3 at the top and borders of 2 everywhere else
    //back.makeBackground();
   
    // NEXT BOX
    strokeWeight(2);
    stroke(255);
    rectMode(CENTER);
    fill(40, 40, 40);
    rect(35.5*width/42, height/2, 160, 400);
    fill(255, 0, 0, 0);
    rect(35.5*width/42, height/2, 160, 400);
    fill(255);
    textSize(20);
    text("NEXT", 600, 620);
    
    // ADD BLOCKS TO NEXT BOX
    for (int i = 0; i < 5; i++) {
      int y = 200+i*70;
      Block block1 = new Block(types[(int) (Math.random()*7)]);
      next.add(block1);
      displayBlock(block1, 625, y);
    }
    //timer start
    savedTime = millis();
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
    noStroke();
    fill(40);
    rectMode(CENTER);
    rect(width/2, height/2 - 10*back.size - 15, 302, 30); //clears the top of the grid in case pieces appear above
    
    int counter = 0;   // counter is the number of rows cleared by the last block
    if(!hasBlock) {

      
      // TAKE NEXT BLOCK
      current = next.removeFirst();
      
      // UPDATE NEXT BOX
      strokeWeight(2);
      stroke(255);
      rectMode(CENTER);
      fill(40, 40, 40);
      rect(35.5*width/42, height/2, 160, 400);
      fill(255, 0, 0, 0);
      rect(35.5*width/42, height/2, 160, 400);
      fill(255);
      textSize(20);
      text("NEXT", 600, 620);
    
      // DISPLAY NEXT BLOCKS
      next.addLast(new Block(types[(int) (Math.random()*7)]));
      Block temp;
      for (int i = 0; i < 5; i++) {
        int y = 200+i*70;
        temp = next.removeFirst();         
        displayBlock(temp, 625, y);
        next.addLast(temp);
      }
      if(current.type != 'O') {
        current.moveUp();
      }
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
    displayBlock(current, (width/2 - 5*back.size), (height/2 - 10*back.size));
    back.checkRows();
    
     //timer increment to move down
    int passedTime = millis() - savedTime;
    //has 1 second passed
    if (passedTime > totalTime) {
      current.moveDown(back);
      savedTime = millis();
    }
  }
  
  void displayGrid(Background game) {
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    int size = back.size;
    for(int i = current.top; i < current.bottom; i++) {
      for(int j = current.left; j < current.right; j++) {
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
        rect((width/2 - 5*size) + (j-current.left)*size, (height/2 - 10*size) + (i-current.top)*size, size, size);
      }
    }
    //outside box
    strokeWeight(2);
    stroke(255);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 600);
  }
  
  void displayBlock (Block current, int x, int y) {
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < current.blocks[current.rotation].length; a++) {
      int i = current.blocks[current.rotation][a][0];
      int j = current.blocks[current.rotation][a][1];
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
       rect(x + j*size, y + i*size, size, size);
    }
  }
