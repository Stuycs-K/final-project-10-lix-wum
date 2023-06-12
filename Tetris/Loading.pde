
  void loadScreen() {
    fill(40);
    rect(0, 0, width, height);
    
    fill(255);
    textSize(30); textAlign(CENTER);
    text("Loading Assets...", width/2, height/2);
    rect(width/4, height/2+30, width/2, 20);
    
    fill(108, 160, 220);
    rect(width/4, height/2+30, loadingProgress*width/2/100, 20);
  }
  
  void loadGame() {
    while(loadingProgress < 100) {
      loadingProgress+=Math.random()*3;
      delay(50);
      updateLoad();
    }
    loadingComplete = true;
  }
  
  void updateLoad() {
    synchronized(this) {
      loadingProgress = constrain(loadingProgress, 0, 100);
    }
  }
