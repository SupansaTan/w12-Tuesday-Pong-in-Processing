void setup(){
  size(500,500);
}

void draw(){
}

class Ball{
  float posX, posY, size;
  int velocity;
  
  Ball(){
    // set ball at center position
    posX = width/2;
    posY = height/2;
    size = 30;
    velocity = 1;
  }
  
  void draw(){
  }
  
  void move(){
  }
  
  boolean bounce(){
    return true;
  }
}

class Paddle{
  float posX, posY, sizeWidth, sizeHeight;
  
  Paddle(){
    sizeWidth = 20;
    sizeHeight = 80;
  }
  
  void draw(){
  }
  
  void move(){
  }
}

class PongGame {
  int player1, player2; // contain score of each player
  
  PongGame(){
    //set start score
    player1 = 0;
    player2 = 0;
  }
  
  void updateScore(){
  }
  
}
