  import java.util.ArrayDeque;
  import java.util.Deque;
  import java.util.ArrayList;
  
  boolean alive = true;
  Background back;
  ArrayList<Block> next = new ArrayList<Block>();  
  boolean holdSpace = false;
  boolean heldAlready = false;
  Block heldBlock;
  Block ghost;
  public double level= 0;
  int score= 0;
  Block current;
  public static boolean hasBlock = false;
  char[] types = { 'T', 'I', 'S', 'Z', 'J', 'L', 'O' };
  int savedTime;
  double totalTime;
  
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    back = new Background(30, 25, 16); //grid has a border of 3 at the top and borders of 2 everywhere else
    //back.makeBackground();
   
    // HOLD BOX
    strokeWeight(2);
    stroke(255);
    rectMode(CENTER);
    fill(40, 40, 40);
    rect(35.5*width/42/5.5, height/2.86, 160, 160);
    fill(255, 0, 0, 0);
    rect(35.5*width/42/5.5, height/2.86, 160, 160);
    fill(255);
    textSize(20);
    text("HOLD", 150, 220);
   
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
    text("NEXT", 600, 595);
    
    // ADD BLOCKS TO NEXT BOX
    for (int i = 0; i < 5; i++) {
      int y = 200+i*70;
      Block block1 = new Block(types[(int) (Math.random()*7)]);
      next.add(block1);
      displayBlock(block1, 625, y);
    }
    //timer start
    savedTime = millis();
    
    //drop speed
    totalTime = (Math.pow((0.8-((level-1)*0.007)),(int)(level-1)))*1000;
    
    backgroundSound();
  }
  
  void keyPressed() {
    if(alive){
    if(key == 'd' || key == 'x') {
      current.rotateRight(back);
      rotateSound();
    }
    if(key == 'a' || key == 'z') {
      current.rotateLeft(back);
      rotateSound();
    }
    if(key == 'l' || keyCode == RIGHT) {
      current.moveRight(back);
      moveSound();
    }
     if(key == 'j' || keyCode == LEFT) {
      current.moveLeft(back);
      moveSound();
    }
    if(key == 'k' || keyCode == DOWN) {
      current.moveDown(back);
      softDropSound();
    }
    if(key == ' ') {
      current.fastDrop(back);
      hardDropSound();
    } 
    if(key == 'c') {
      if(!heldAlready){
        hold(current);
        heldAlready = true;
      }
    }
    }
  }
  
  void draw() {
    if(alive) {
    //check if lost
    for(int i = back.left; i < back.right; i++) {
      if(back.game[back.top][i] != 'B') {
        alive = false;
      }
    }
    
    // timer
    noStroke();
    fill(40, 40, 40);
    rectMode(CENTER);
    rect(387, 730, 70, 50);
    fill(255);
    int s = millis()/1000; 
    int m = s/60;
    s -= m*60;
    if (s < 10) text("" +m + ":0" + s , 387, 730);
    else text("" +m + ":" + s , 387, 730);

    noStroke();
    fill(40);
    rectMode(CENTER);
    rect(width/2, height/2 - 10*back.size - 15, 302, 30); //clears the top of the grid in case pieces appear above
    
    if(!hasBlock) {

      updateNext();
      heldAlready = false;
      if(current.type != 'O') {
        current.moveUp();
      }
      current.moveRight();
      current.moveRight();
      current.moveRight();
      hasBlock = true;
    }
    
    noFill();
    displayGrid(back);
    displayBlock(current, (width/2 - 5*back.size), (height/2 - 10*back.size));
    
    //making the ghost piece
    ghost = current.ghost(back);
    displayGhost(ghost, (width/2 - 5*back.size), (height/2 - 10*back.size));
    
    int rowsCleared = back.checkRows();
    
    score(rowsCleared);
    
    rowsCleared = 0;
    
     //timer increment to move down
    totalTime = (Math.pow((0.8-((level-1)*0.007)),(int)(level-1)))*1000;
    int passedTime = millis() - savedTime;
    //has 1 second passed
    if (passedTime > totalTime) {
      current.moveDown(back);
      savedTime = millis();
    }
   } else {
     rectMode(CENTER);
     fill(40);
     rect(width/2, height/2, 800, 800);
     fill(204, 0, 0);
     textAlign(CENTER);
     textSize(64);
     text("YOU LOST xD", width/2, height/2);
     fill(200);
     textSize(32);
     text("Final Score: " + score, width/2, height/2 + 80);
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
  
  void displayBlockCosmetic (Block current, int x, int y) {
    if(current.type == 'O') {
      x += 10;
      y += 30;
    } else if(current.type == 'I') {
      x -= 10;
      y -= 15;
    }
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
  
  void displayGhost (Block ghost, int x, int y) {
    int size = back.size;
    stroke(220,220,220);
    strokeWeight(1);
    rectMode(CORNER);
    for(int a = 0; a < ghost.blocks[ghost.rotation].length; a++) {
      int i = ghost.blocks[ghost.rotation][a][0];
      int j = ghost.blocks[ghost.rotation][a][1];
      fill(200, 128);
      rect(x + j*size, y + i*size, size, size);
    }
  }
    
    void updateNext() {
            
      // TAKE NEXT BLOCK
      current = next.remove(0);
      
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
      text("NEXT", 600, 595);
    
      // DISPLAY NEXT BLOCKS
      next.add(new Block(types[(int) (Math.random()*7)]));
      for (int i = 0; i < 5; i++) {
        int y = 200+i*70;        
        displayBlockCosmetic(next.get(i), 625, y);
      }
    }
    
    void score (int counter) {
    if (counter != 0) {
        // score and level calculator
    int scoreAdd = 0;
    if (counter == 10) { 
      scoreAdd = (40*((int) (level+1)));
      singleSound();
    }
    else if (counter == 20) {
      scoreAdd = (100*((int) (level+1)));
      doubleSound();
    }
    else if (counter == 30) {
      scoreAdd = (300*((int) (level+1)));
      tripleSound();
    }
    else if (counter == 40) {
      scoreAdd = (1200*((int) (level+1)));
      tetrisSound();
    }
    score += scoreAdd;
    level = level +  (0.01*counter); 
    level = rounder(level); }
    
    // level indicatorx
    noStroke();
    fill(40, 40, 40);
    rect(0, 0, 100, 100);
    fill(255);
    textSize(30);
    String printScore = "";
    //if (score < 10) printScore = "000000"+score;
    //else if (score < 100) printScore = "00000"+score;
    //else if (score < 1000) printScore = "0000"+score;
    //else if (score < 10000) printScore = "000"+score;
    //else if (score < 100000) printScore = "00"+score; 
    //else if (score < 1000000) printScore = "0"+score;
    //else printScore = ""+score;
    text(score, 8, 30);
    textSize(15);
    text("Level "+((int)(level)), 9, 45);
      
    }
    
    // helper method for score
    double rounder(double num) {
      int sum = (int) ((num/0.1) + 0.00001);
      return sum/10.0 + 0.0001;
    }
    
    void hold(Block current) {
    //print("hold");
    if (holdSpace) {
      next.add(0, new Block(heldBlock.type));
      heldBlock = new Block(current.type);
      updateNext();
      // REDRAW HOLD BOX
      strokeWeight(2);
      stroke(255);
      rectMode(CENTER);
      fill(40, 40, 40);
      rect(35.5*width/42/5.5, height/2.86, 160, 160);
      fill(255, 0, 0, 0);
      rect(35.5*width/42/5.5, height/2.86, 160, 160);
      fill(255);
      textSize(20);
      text("HOLD", 150, 220);
      
      displayBlockCosmetic(heldBlock, 80,220);
      //if(current.type != 'O') {
      //  current.moveUp();
      //}
      //current.moveRight();
      //current.moveRight();
      //current.moveRight();
      //hasBlock = true;
    }
    else {
      holdSpace = true;
      heldBlock = new Block(current.type);
      displayBlockCosmetic(heldBlock, 80,220);
      updateNext();
      
    }
  }
  
