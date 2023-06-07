  public boolean alive = true;
  public boolean gameStarted = false;
  public boolean elementalGameStarted = false;
  public boolean openConfig = false;
  public boolean lose = false;
  public boolean paused = false;
  
    void menu() {
      if (gameStarted == false) {
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
    
    textSize(25);
    text("Move Left", width/3, 150);
    text("Move Right", width/3, 190);
    text("Rotate Clockwise", width/3, 230);
    text("Rotate Counterclockwise", width/3, 270);
    text("Soft Drop", width/3, 310);
    text("Hard Drop", width/3, 350);
    text("Hold Piece", width/3, 390);
    text("Pause Game", width/3, 430);
    

    // Make array of temp Keybinds to be displayed
    for (int i = 0; i < tempKeybinds.length; i++) {
      if (keybinds[i] == '!') tempKeybinds[i] = "UP";
      else if (keybinds[i] == '@') tempKeybinds[i] = "LEFT";
      else if (keybinds[i] == '#') tempKeybinds[i] = "DOWN";
      else if (keybinds[i] == '$') tempKeybinds[i] = "RIGHT";
      else if (keybinds[i] == ' ') tempKeybinds[i] = "SPACE";
      else tempKeybinds[i] = Character.toUpperCase(keybinds[i]) + "";
    }
    
    // display keybinds
    text(tempKeybinds[4], 2*width/3, 150);
    text(tempKeybinds[5], 2*width/3+100, 150);
    text(tempKeybinds[6], 2*width/3, 190);
    text(tempKeybinds[7], 2*width/3+100, 190);
    text(tempKeybinds[2], 2*width/3, 230);
    text(tempKeybinds[3], 2*width/3+100, 230);
    text(tempKeybinds[0], 2*width/3, 270);
    text(tempKeybinds[1], 2*width/3+100, 270);
    text(tempKeybinds[8], 2*width/3, 310);
    text(tempKeybinds[9], 2*width/3+100, 310);
    text(tempKeybinds[10], 2*width/3, 350);
    text(tempKeybinds[11], 2*width/3, 390);
    text(tempKeybinds[12], 2*width/3, 430);
    
    
    
    
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
        backgroundSound.pause();
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
