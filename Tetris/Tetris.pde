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
  char[] elements = {'F', 'W', 'A', 'L', 'E', '0'};
  int savedTime;
  double totalTime;
  PImage image;
  int startTime = 0;
  
  int loadingProgress = 0;
  boolean loadingComplete = false;
  
  // keybind variables
  public int changeKeybind = -1;
  public char [] keybinds = new char[] {'a', 'z', 'd', 'x', '@', 'j', '$', 'l', '#', 'k', ' ', 'c', 'p'};
  //public char rotateLeft1 = 'a'; 0
  //public char rotateLeft2 = 'z'; 1
  //public char rotateRight1 = 'd'; 2
  //public char rotateRight2 = 'x'; 3
  //public char moveLeft1 = '@'; 4
  //public char moveLeft2 = 'j'; 5
  //public char moveRight1 = '$'; 6 
  //public char moveRight2 = 'l'; 7
  //public char moveDown1 = '#'; 8
  //public char moveDown2 = 'k'; 9
  //public char hardDrop = ' '; 10
  //public char hold = 'c'; 11
  //public char pause = 'p'; 12
   
  void setup() {
    size(800, 800);
    background(40, 40, 40);
    thread("loadGame"); 
    thread("loadSound");
  }
  
  void draw() {
    if (loadingComplete) {
     if (openConfig) {
       config();
       volumeCheck();
       if (changeKeybind != -1) swapKeybind();
       if (sameKey) printChooseNewKey();
     }  
     else if (gameStarted) gamePlay(); 
     else if (elementalGameStarted) elementalPlay();
     else menu();
    } else {
      loadScreen();
    }
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
      Block block1 = new Block(types[(int) (Math.random()*7)], elements[(int) (Math.random()*5)]);
      next.add(block1);
      displayBlock(block1, 625, y);
    }
    //timer start
    savedTime = millis();
    
    //drop speed
    totalTime = (Math.pow((0.8-((level-1)*0.007)),(int)(level-1)))*1000;
    float sound = (float) volume/200; 
    backgroundSound.amp(sound);
    backgroundSound.loop();
  }
  
  void startedElemental() {
    textAlign(LEFT);
    fill(40, 40, 40);
    rect(width/2, height/2, 1000, 1000);
    back = new Background(30, 25, 16); //grid has a border of 3 at the top and borders of 2 everywhere else
    //back.makeBackground();
    back.elemental = true;
   
    holdBox();
    nextBox();
    
    // ADD BLOCKS TO NEXT BOX
    for (int i = 0; i < 5; i++) {
      int y = 200+i*70;
      Block block1 = new Block(types[(int) (Math.random()*7)]);
      next.add(block1);
      block1.setElement(block1.elements[(int) (Math.random()*5)]);
      displayBlock(block1, 625, y);
    }
    //timer start
    savedTime = millis();
    
    //drop speed
    totalTime = (Math.pow((0.8-((level-1)*0.007)),(int)(level-1)))*1000;
    float sound = (float) volume/200; 
    backgroundSound.amp(sound);
    backgroundSound.loop();
  }
  
  void mousePressed() {
    
    mouseColor = get(mouseX, mouseY); // get color
    float red = red(mouseColor); float green = green(mouseColor); float blue = blue(mouseColor);
    //print(red + " " + green + " " + blue);
    
    if (red == 192 && green == 192 && blue == 192) { openConfig = !openConfig;}
    if (openConfig && changeKeybind == -1) {
      if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 150-7-15 && mouseY < 150-7+15) {
        keybinds[4] = '-';
        changeKeybind = 4;
        //print("change!");
      } else if (mouseX > 2*width/3+100-70 && mouseX < 2*width/3+100+70 && mouseY > 150-7-15 && mouseY < 150-7+15) {
        keybinds[5] = '-';
        changeKeybind = 5;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 190-7-15 && mouseY < 190-7+15) {
        keybinds[6] = '-';
        changeKeybind = 6;
      } else if (mouseX > 2*width/3+100-70 && mouseX < 2*width/3+100+70 && mouseY > 190-7-15 && mouseY < 190-7+15) {
        keybinds[7] = '-';
        changeKeybind = 7;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 230-7-15 && mouseY < 230-7+15) {
        keybinds[2] = '-';
        changeKeybind = 2;
      } else if (mouseX > 2*width/3+100-70 && mouseX < 2*width/3+100+70 && mouseY > 230-7-15 && mouseY < 230-7+15) {
        keybinds[3] = '-';
        changeKeybind = 3;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 270-7-15 && mouseY < 270-7+15) {
        keybinds[0] = '-';
        changeKeybind = 0;
      } else if (mouseX > 2*width/3+100-70 && mouseX < 2*width/3+100+70 && mouseY > 270-7-15 && mouseY < 270-7+15) {
        keybinds[1] = '-';
        changeKeybind = 1;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 310-7-15 && mouseY < 310-7+15) {
        keybinds[8] = '-';
        changeKeybind = 8;
      } else if (mouseX > 2*width/3+100-70 && mouseX < 2*width/3+100+70 && mouseY > 310-7-15 && mouseY < 310-7+15) {
        keybinds[9] = '-';
        changeKeybind = 9;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 350-7-15 && mouseY < 350-7+15) {
        keybinds[10] = '-';
        changeKeybind = 10;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 390-7-15 && mouseY < 390-7+15) {
        keybinds[11] = '-';
        changeKeybind = 11;
      } else if (mouseX > 2*width/3-50-70 && mouseX < 2*width/3-50+70 && mouseY > 430-7-15 && mouseY < 430-7+15) {
        keybinds[12] = '-';
        changeKeybind = 12;
       
        // SOUND
      } else if (mouseX > 2*width/3-50-70-15-5 && mouseX < 2*width/3-50-70-15+5 && mouseY > 500-7-5 && mouseY < 500-7+5) {
        volume-=10;
        volumeCheck();
      } else if (mouseX > 2*width/3-50+70+15-5 && mouseX < 2*width/3-50+70+15+5 && mouseY > 500-7-5 && mouseY < 500-7+5) {
        volume+=10;
        volumeCheck();
      } else {
          if (red == 224 && green == 224 && blue == 224) {
            restart();
            openConfig = false;
         }
       }
    }
    else {
    if (red == 255 && green == 255 && blue == 153) {
      restart();
      started();
      gameStarted = true;
      startTime = millis();
    } else if (red == 204 && green == 255 && blue == 153) {
      restart();
      startedElemental();
      elementalGameStarted = true;
      startTime = millis();
    } else if (red == 224 && green == 224 && blue == 224 && alive ) {
      restart();
      openConfig = true;
    } else if (red == 224 && green == 224 && blue == 224 && !alive ) {
      newGame();
    } else if (red == 255 && green == 204 && blue == 203 && alive ) {
      newGame();
    } 
    }

  }
  
  void newGame() {
    paused = false; restart();
    restart();
    menu();
    alive = true;
    score = 0; level = 0; lose = false;
    startTime = millis();
  }
  
  void restart() {
    gameStarted = false;
    elementalGameStarted = false;
    openConfig = false;
  }
  
  void keyPressed() {
    
    if (key == CODED) if (keyCode == UP) key = '!';
    if (key == CODED) if (keyCode == LEFT) key = '@';
    if (key == CODED) if (keyCode == DOWN) key = '#';
    if (key == CODED) if (keyCode == RIGHT) key = '$';
    //print(key+"!");
    
    if (keySwap) {
      sameKey = false;
      for (int i=0; i < keybinds.length; i++) {
        if (key == keybinds[i]) sameKey = true;
      }
      if (sameKey == false) {
        keySwap = false;
        keybinds[changeKeybind] = key;
        changeKeybind = -1;
      }
    }
    
    else {
    if(alive){
    if(key == keybinds[2] || key == keybinds[3]) {
      current.rotateRight(back);
      rotateSound();
    }
    if(key == keybinds[0] || key == keybinds[1]) {
      current.rotateLeft(back);
      rotateSound();
    }
    if(key == keybinds[6] || key == keybinds[7]) {
      current.moveRight(back);
      moveSound();
    }
     if(key == keybinds[4] || key == keybinds[5]) {
      current.moveLeft(back);
      moveSound();
    }
    if(key == keybinds[8] || key == keybinds[9]) {
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
    if(key == keybinds[10]) {
      current.fastDrop(back);
      hardDropSound();
    } 
    if(key == keybinds[11]) {
      if(!heldAlready){
        hold(current);
        heldAlready = true;
      }
    }
    if(key == keybinds[12] && !openConfig) {
      paused = !paused;
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
    
    textAlign(LEFT);
    fill(40, 40, 40);
    rect(width/2, height/2, 1000, 1000);
   
    holdBox();
    nextBox();
    for (int i = 0; i < 5; i++) {
      int y = 200+i*70;        
      displayBlockCosmetic(next.get(i), 625, y);
    }
    //print(heldAlready);
    if (holdSpace) displayBlockCosmetic(heldBlock, 80,220);
    if (!backgroundSound.isPlaying())backgroundSound.play();
        
    // timerz
    noStroke();
    fill(40, 40, 40);
    rectMode(CENTER);
    rect(700, 20, 300, 100); // covers pause
    rect(8, 30, 300, 300);
    rect(387, 730, 70, 50); 
    fill(255);
    int s = (millis()-startTime)/1000; 
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
    text(Character.toUpperCase(keybinds[12]) + " to pause", 700, 20);
    
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
     
     fill(224,224,224);
     rect(width/2, 2*height/3+150, 800, 50);
     fill(0);
     text("MAIN MENU", width/2, 2*height/3+150);
     
     if (lose == false) { loseSound(); lose = true; }
   }
     }else {
       pauseGame();
     }

   }
  
  void elementalPlay() {
    //print("played elemental game");
    if (!paused) {
    textAlign(LEFT);
      if(alive) {
    //check if lost
    for(int i = back.left; i < back.right; i++) {
      if(back.game[back.top][i] != 'B') {
        alive = false;
      }
    }
    
    textAlign(LEFT);
    fill(40, 40, 40);
    rect(width/2, height/2, 1000, 1000);
   
    holdBox();
    nextBox();
    for (int i = 0; i < 5; i++) {
      int y = 200+i*70;        
      displayBlockCosmeticElemental(next.get(i), 625, y);
    }
    if (holdSpace) displayBlockCosmeticElemental(heldBlock, 80,220);
    if (!backgroundSound.isPlaying())backgroundSound.play();
    
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

      updateNextElemental();
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
    displayGridElemental(back);
    displayBlockElemental(current, (width/2 - 5*back.size), (height/2 - 10*back.size));
    
    //making the ghost piece
    ghost = current.ghost(back);
    displayGhost(ghost, (width/2 - 5*back.size), (height/2 - 10*back.size));
    
    int rowsCleared = back.checkRows();
    
    score(rowsCleared);
    textSize(20);
    text(Character.toUpperCase(keybinds[12]) + " to pause", 700, 20);
    
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
     
     fill(224,224,224);
     rect(width/2, 2*height/3+150, 800, 50);
     fill(0);
     text("MAIN MENU", width/2, 2*height/3+150);
     if (lose == false) { loseSound(); lose = true; }
   }
     }else {
       pauseGame();
     }
  }
  
  
  void volumeCheck() {
    fill(255); textSize(10);
    if (volume > 200) {
      text("(already at max volume)", width/3, 515);
      volume = 201;
    }
    else if (volume < 0) {
      text("(already at min volume)", width/3, 515);
      volume = -1;
    }
  }
  
  
