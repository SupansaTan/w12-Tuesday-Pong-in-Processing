Paddle paddle;
Ball ball;
color black;

void setup(){
  size(800,600);
  black = color(0); // set rgb color : black
  background(black);
  paddle = new Paddle();
  ball = new Ball();
}

void draw(){
  background(black);
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
    this.move();
  }
  
  void move(){
    if (mousePressed == true){
      if (pos1X <= mouseX && mouseX <= pos1X+sizeWidth && pos1Y <= mouseY && mouseY <= pos1Y+sizeHeight){
        // when mouse pressed paddle player1 (paddle left)
        float distY = pos1Y+(sizeHeight/2)- mouseY; // distance between mouseY and posY of paddle left
        pos1Y -= distY;
      }
      else if(pos2X <= mouseX && mouseX <= pos2X+sizeWidth && pos2Y <= mouseY && mouseY <= pos2Y+sizeHeight){
        // when mouse pressed paddle player2 (paddle right)
        float distY = pos2Y+(sizeHeight/2)- mouseY; // distance between mouseY and posY of paddle right
        pos2Y -= distY;
      }
    }
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
