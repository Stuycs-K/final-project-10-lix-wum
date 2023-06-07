  public boolean alive = true;
  public boolean gameStarted = false;
  public boolean elementalGameStarted = false;
  public boolean openKeybindMenu = false;
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
        fill(255,255, 153);
        rect(width/2, 2*height/3, 800, 50);
        fill(0);
        text("PLAY STANDARD GAME", width/2, 2*height/3);
    
        // play elemental game button
        fill(204,255, 153);
        rect(width/2, 2*height/3+75, 800, 50);
        fill(0);
        text("PLAY ELEMENTAL GAME", width/2, 2*height/3+75);
        
        // open config
        
      }
  }
  
  void keybindMenu(){
    print("null");
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
