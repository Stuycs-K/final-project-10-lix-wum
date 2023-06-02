import processing.sound.*;
SoundFile file;

public void backgroundSound() {
  file = new SoundFile(this, "tetris.mp3", false); file.loop(); 
} 

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
