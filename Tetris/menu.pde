  public boolean alive = true;
  public boolean gameStarted = false;
  public boolean elementalGameStarted = false;
  public boolean openConfig = false;
  public boolean lose = false;
  public boolean paused = false;
  public boolean keySwap = false;
  public char keySwitch;
  public boolean sameKey = false;
  public int volume = 100;
  
    void menu() {
      if (gameStarted == false) {
        fill(40); rect(width/2, height/2, 800, 800);
        imageMode(CENTER);
        image = loadImage("gameIcon.png");
        image(image, width/2, width/3);
        noStroke();
        rectMode(CENTER);
        textAlign(CENTER);
        textSize(25);
    
        // play game button
        fill(255,255,153);
        rect(width/2, 2*height/3, 800, 50);
        fill(0);
        text("PLAY STANDARD GAME", width/2, 2*height/3);
    
        // play elemental game button
        fill(204,255,153);
        rect(width/2, 2*height/3+75, 800, 50);
        fill(0);
        text("PLAY ELEMENTAL GAME", width/2, 2*height/3+75);
        
        // open config button
        fill(224,224,224);
        rect(width/2, 2*height/3+150, 800, 50);
        fill(0);
        text("GAME CONFIG", width/2, 2*height/3+150);
      }
  }
  
  void config(){
    
    String[] tempKeybinds = new String [keybinds.length];
    
    fill(40); rectMode(CENTER);
    rect(width/2, height/2, 800, 800);
    fill(0);
    
    textSize(40); fill(255);
    text("CONFIGURATIONS", width/2, 50);
    textSize(25);
    text("Change your keybinds!", width/2, 85);
    
    //fill(40); stroke(155); 
    //rect(width/3, 150-7, 270, 30);
    //rect(width/3, 190-7, 270, 30);
    //rect(width/3, 230-7, 270, 30);
    //rect(width/3, 270-7, 270, 30);
    //rect(width/3, 310-7, 270, 30);
    //rect(width/3, 350-7, 270, 30);
    //rect(width/3, 390-7, 270, 30);
    //rect(width/3, 430-7, 270, 30);

    fill(255);
    textSize(25);
    text("Move Left", width/3, 150);
    text("Move Right", width/3, 190);
    text("Rotate Clockwise", width/3, 230);
    text("Rotate Counterclockwise", width/3, 270);
    text("Soft Drop", width/3, 310);
    text("Hard Drop", width/3, 350);
    text("Hold Piece", width/3, 390);
    text("Pause Game", width/3, 430);
    
    text("Volume", width/3, 500);

    // Make array of temp Keybinds to be displayed
    for (int i = 0; i < tempKeybinds.length; i++) {
      if (keybinds[i] == '!') tempKeybinds[i] = "UP";
      else if (keybinds[i] == '@') tempKeybinds[i] = "LEFT";
      else if (keybinds[i] == '#') tempKeybinds[i] = "DOWN";
      else if (keybinds[i] == '$') tempKeybinds[i] = "RIGHT";
      else if (keybinds[i] == ' ') tempKeybinds[i] = "SPACE";
      else tempKeybinds[i] = Character.toUpperCase(keybinds[i]) + "";
    }
    
    fill(40); stroke(155); 
    rect(2*width/3-50, 150-7, 140, 30);
    rect(2*width/3+100, 150-7, 140, 30);
    rect(2*width/3-50, 190-7, 140, 30);
    rect(2*width/3+100, 190-7, 140, 30);
    rect(2*width/3-50, 230-7, 140, 30);
    rect(2*width/3+100, 230-7, 140, 30);
    rect(2*width/3-50, 270-7, 140, 30);
    rect(2*width/3+100, 270-7, 140, 30);
    rect(2*width/3-50, 310-7, 140, 30);
    rect(2*width/3+100, 310-7, 140, 30);
    rect(2*width/3-50, 350-7, 140, 30);
    rect(2*width/3-50, 390-7, 140, 30);
    rect(2*width/3-50, 430-7, 140, 30);
    
    // Sound thing - fix later
    rectMode(CORNER);
    rect(2*width/3-50-70, 500-7-15, 140, 30);
    fill(255);
    rect(2*width/3-50-70, 500-7-15, 1.4*volume, 30);
    image = loadImage("subtract.png");
    image.resize(10, 10);
    image(image, 2*width/3-50-70-15, 500-7);
    image = loadImage("add.png");
    image.resize(10, 10);
    image(image, 2*width/3-50+70+15, 500-7);
    
    
    // display keybinds
    fill(255);
    text(tempKeybinds[4], 2*width/3-50, 150);
    text(tempKeybinds[5], 2*width/3+100, 150);
    text(tempKeybinds[6], 2*width/3-50, 190);
    text(tempKeybinds[7], 2*width/3+100, 190);
    text(tempKeybinds[2], 2*width/3-50, 230);
    text(tempKeybinds[3], 2*width/3+100, 230);
    text(tempKeybinds[0], 2*width/3-50, 270);
    text(tempKeybinds[1], 2*width/3+100, 270);
    text(tempKeybinds[8], 2*width/3-50, 310);
    text(tempKeybinds[9], 2*width/3+100, 310);
    text(tempKeybinds[10], 2*width/3-50, 350);
    text(tempKeybinds[11], 2*width/3-50, 390);
    text(tempKeybinds[12], 2*width/3-50, 430);

    if (!gameStarted) {
      fill(224,224,224);
      rectMode(CENTER);
      rect(width/2, 2*height/3+150, 800, 50);
      fill(0);
      text("BACK TO MENU", width/2, 2*height/3+150);
    } else {
      fill(192, 192, 192);
      rectMode(CENTER);
      rect(width/2, 2*height/3+75, 800, 50);
      fill(0);
      text("BACK TO PAUSE", width/2, 2*height/3+75);
    }
  }
  
  void pauseGame() {
    if (gameStarted) {
      if (paused) {
        rectMode(CENTER);
        fill(104, 104, 104);
        stroke(104);
        rect(width/2, height/2, 800, 800);
        textAlign(CENTER);
        textSize(50);
        fill(255);
        text("PAUSED", width/2, height/2);
        textAlign(LEFT);
        if (backgroundSound.isPlaying()) backgroundSound.pause();
        
        noStroke();
        rectMode(CENTER);
        textAlign(CENTER);
        textSize(25);
        
        fill(255, 204, 203);
        rect(width/2, 2*height/3, 800, 50);
        fill(0);
        text("MAIN MENU", width/2, 2*height/3);
        
        fill(192);
        rect(width/2, 2*height/3+75, 800, 50);
        fill(0);
        text("OPEN CONFIG", width/2, 2*height/3+75);
        
      } else {
        //started();
        rectMode(CENTER);
        fill(40);
        stroke(40);
        rect(width/2, height/2, 800, 800);
        holdBox();
        nextBox();
        for (int i = 0; i < 5; i++) {
          int y = 200+i*70;        
          displayBlockCosmetic(next.get(i), 625, y);
        }
        if (heldAlready) displayBlockCosmetic(heldBlock, 80,220);
        backgroundSound.play();
      }
    }
  }

  public void swapKeybind() {
    keySwap = true;
    if (keySwap) {
      rectMode(CENTER);
      fill(104, 104, 104);
      stroke(104);
      rect(width/2, height/2, 800, 800);
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text("PRESS YOUR DESIRED KEYBIND", width/2, height/2);
    }
  }
  
  public void printChooseNewKey() {
        textAlign(CENTER);
        textSize(30);
        fill(255);
        text("CHOOSE A UNIQUE KEYBIND", width/2, height/2+70);
  }
