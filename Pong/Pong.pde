void setup(){
  size(800,600);
  background(0); // set backgroud color : black 
}

void draw(){
}

class Ball{
  float posX, posY, size, direction;
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
  
  void move(float posX, float posY, float direction){
  }
  
  boolean bounce(float posX, float posY){
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
  
  void move(float posX, float posY){
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
