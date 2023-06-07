  import java.util.concurrent.TimeUnit;
  import java.util.ArrayDeque;
  import java.util.Deque;
  import java.util.ArrayList;
  import processing.sound.*;

  // variables
  SoundFile backgroundSound;  
  Background back;
  color mouseColor;
  ArrayList<Block> next = new ArrayList<Block>();  
  ArrayList<Block> sevenBag = new ArrayList<Block>();
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
  PImage image;
   
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    backgroundSound = new SoundFile(this, "tetris.mp3", false);
  }
  
  void draw() {
   
   if (gameStarted) gamePlay();
   if (elementalGameStarted) elementalPlay();
   if (openConfig) config();
   else menu();
  }
  
  
  void started() {
    textAlign(LEFT);
    fill(40, 40, 40);
    rect(width/2, height/2, 1000, 1000);
    back = new Background(30, 25, 16); //grid has a border of 3 at the top and borders of 2 everywhere else
    //back.makeBackground();
   
    holdBox();
    nextBox();
    
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
    
    backgroundSound.loop();
  }
  
  void mousePressed() {
    mouseColor = get(mouseX, mouseY); // get color
    float red = red(mouseColor); float green = green(mouseColor); float blue = blue(mouseColor);
    //print(red + " " + green + " " + blue);
    if (red == 255 && green == 255 && blue == 153) {
      restart();
      started();
      gameStarted = true;
    } else if (red == 204 && green == 255 && blue == 153) {
      restart();
      elementalGameStarted = true;
    } else if (red == 224 && green == 224 && blue == 224) {
      restart();
      openConfig = true;
    }
  }
  
  void restart() {
    gameStarted = false;
    elementalGameStarted = false;
    openConfig = false;
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
      current.moveDown();
      if(current.hasCollision(back)) {
        current.moveUp();
      } else {
        current.moveUp();
        current.moveDown(back);
        softDropSound();
        savedTime = millis();
      }
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
    if(key == 'p') {
      if(paused){
        paused = false;
        pauseGame();
      } else {
        paused = true;
        pauseGame();
      }
    }
    }
  }
  
  void gamePlay() {
    if (!paused) {
    textAlign(LEFT);
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
    rect(700, 20, 300, 100); // covers pause
    rect(8, 30, 300, 300);
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
    textSize(20);
    text("P to pause", 700, 20);
    
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
     backgroundSound.stop();
     if (lose == false) { loseSound(); lose = true; }
   }
     }else {
       // do nothing, paused game
     }

   }
  
  void elementalPlay() {
    print("played elemental game");
  }
  
  
  
