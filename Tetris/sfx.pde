import processing.sound.*;
SoundFile file;

// DROP SOUNDS
public void hardDropSound() {
  file = new SoundFile(this, "hardDrop.wav", false); file.play(); 
  file.removeFromCache();
}
public void softDropSound() {
  file = new SoundFile(this, "softDrop.wav", false); file.play(); 
  file.removeFromCache();
}

// ROW CLEAR SOUNDS
public void singleSound() {
  file = new SoundFile(this, "single.wav", false); file.play(); 
  file.removeFromCache();
}
public void doubleSound() {
  file = new SoundFile(this, "double.wav", false); file.play(); 
  file.removeFromCache();
}
public void tripleSound() {
  file = new SoundFile(this, "triple.wav", false); file.play(); 
  file.removeFromCache();
}
public void tetrisSound() {
  file = new SoundFile(this, "tetris.wav", false); file.play();
  file.removeFromCache();
}

// PIECE MOVE SOUNDS
public void moveSound() {
  file = new SoundFile(this, "move.wav", false); file.play(); 
  file.removeFromCache();
}
public void rotateSound() {
  file = new SoundFile(this, "rotate.wav", false); file.play(); 
  file.removeFromCache();  
}

// MISC
public void loseSound() {
  file = new SoundFile(this, "loseSound.mp3", false); file.play(); 
  file.removeFromCache();  
}

// ELEMENTAL REACTIONS
