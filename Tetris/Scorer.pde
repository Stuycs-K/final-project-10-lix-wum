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
    if (score < 10) printScore = "000000"+score;
    else if (score < 100) printScore = "00000"+score;
    else if (score < 1000) printScore = "0000"+score;
    else if (score < 10000) printScore = "000"+score;
    else if (score < 100000) printScore = "00"+score; 
    else if (score < 1000000) printScore = "0"+score;
    else printScore = ""+score;
    text(printScore, 8, 30);
    textSize(15);
    text("Level "+((int)(level)), 9, 45);
      
    }
    
    // helper method for score
    double rounder(double num) {
      int sum = (int) ((num/0.1) + 0.00001);
      return sum/10.0 + 0.0001;
    }
