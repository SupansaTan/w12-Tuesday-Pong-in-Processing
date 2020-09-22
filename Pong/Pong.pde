Paddle paddle;
Ball ball;

void setup(){
  size(800,600);
  background(0); // set backgroud color : black 
  paddle = new Paddle();
  ball = new Ball();
}

void draw(){
  ball.draw();
  paddle.draw();
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
    circle(posX, posY, size);
  }
  
  void move(float posX, float posY, float direction){
  }
  
  boolean bounce(float posX, float posY){
    return true;
  }
  
}

class Paddle{
  float pos1X, pos1Y, pos2X, pos2Y, sizeWidth, sizeHeight;
  
  Paddle(){
    sizeWidth = 30;
    sizeHeight = 200;
    pos1X = 0;
    pos1Y = height/2 - sizeHeight/2;
    pos2X = width - sizeWidth;
    pos2Y = height/2 - sizeHeight/2;
  }
  
  void draw(){
    rect(pos1X, pos1Y, sizeWidth, sizeHeight);
    rect(pos2X, pos2Y, sizeWidth, sizeHeight);
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
