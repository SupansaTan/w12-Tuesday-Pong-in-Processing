PongGame startGame;
Paddle paddle;
Ball ball;
Wall[] wall;
color black;

void setup(){
  size(800,600);
  black = color(0); // set rgb color : black
  background(black);
  startGame = new PongGame();
  paddle = new Paddle();
  ball = new Ball();
  wall = new Wall[2];
  
  for (int i=0; i<2 ;i++){
    wall[i] = new Wall();
  }
  
}

void draw(){
  background(black);
  startGame.draw();
  ball.draw();
  paddle.draw();
  
  for( Wall w : wall){
    w.draw();
  }
}

class Ball{
  float posX, posY, size, direction;
  int velocity, degree = 0;
  
  Ball(){
    // set ball at center position
    posX = width/2;
    posY = height/2;
    size = 30;
    direction = 1;
    velocity = 1;
  }
  
  void draw(){
    this.move();
    circle(posX, posY, size);
  }
  
  void move(){
    this.bounce();
    
    this.posX += 5 * velocity * direction * cos(radians(degree)); 
    this.posY += 5 * velocity * direction * sin(radians(degree));
  }
  
  float getX(){
    return this.posX;
  }
  
  float getY(){
    return this.posY;
  }
  
  float bounce(){
    if(this.posX+this.size/2 >= paddle.pos2X && (paddle.pos2Y <= this.posY && this.posY <= paddle.pos2Y + paddle.sizeHeight)){
      // if the ball bounce with paddle right
      direction = -1 * direction;
      float distPos = paddle.pos2Y - paddle.lastPos2Y;
      
      if(distPos < 0){
        // paddle is moved up
        velocity = 1;
        degree = 10;
      }
      else if(distPos > 0){
        // paddle is moved down
        velocity = 1;
        degree = -10;
      }
      else{
        velocity += 1;
      }
      return degree;
    }
    else if(this.posX <= 0|| this.posY <= 0 || this.posY >= height){
      // if the ball bounce with the edge of widget
      direction = -1 * direction;
      return 0;
    }
    return 0;
  }
  
  boolean bounceEdge(){
    if(this.posX <= 0 || this.posX >= width){
      // if the ball bounce with left or right edge of widget
      return true;
    }
    return false;
  }
  
}

class Paddle{
  float pos2X, pos2Y, sizeWidth, sizeHeight;
  float dist2Y;
  float lastPos2Y;
  
  Paddle(){
    sizeWidth = 30;
    sizeHeight = 200;
    pos2X = width - sizeWidth;
    pos2Y = height/2 - sizeHeight/2;
    lastPos2Y = pos2Y;
  }
  
  void draw(){
    if (mousePressed){
      this.move();
    }
    rect(pos2X, pos2Y, sizeWidth, sizeHeight); // paddle right (player2)
  }
  
  void move(){
    dist2Y = pos2Y+(sizeHeight/2)- mouseY;  // distance between mouseY and center posY of paddle right
    
    //check the paddles don't beyond the edge
    if (0 <= this.pos2Y-dist2Y && this.pos2Y-dist2Y+this.sizeHeight <= height){
      if(this.pos2X <= mouseX && mouseX <= this.pos2X+this.sizeWidth && this.pos2Y <= mouseY && mouseY <= this.pos2Y+this.sizeHeight){
        // when mouse pressed paddle player2 (paddle right)
        lastPos2Y = this.pos2Y;
        this.pos2Y -= dist2Y;
      }
    }
  }
  
  float getPos(int numPaddle, String pos){
    if (numPaddle == 2){
      if(pos == "X"){
        return pos2X;
      }
      else{
        return pos2Y;
      }
    }
    return 0;
  }
}

class Wall {
  int posX, posY;
  
  Wall(){
    posX = (int)random(width/2);
    posY = (int)random(height/2);
  }
  
  void draw(){
    fill(255);
    rect(posX,posY,20,70);
  }
  
  boolean isBlock(){
    return true;
  }
}

class PongGame {
  int player2; // contain score of each player
  int size; 
  
  
  PongGame(){
    //set start score
    player2 = 0;
    size = 10; // set width of rectangle at center
  }
  
  void draw(){    
    // show score
    textSize(50);
    text(player2, width/2 + width/5, height/8);
    
    this.updateScore();
  }
  
  void updateScore(){
    // when the ball bounce with left or right edge of widget 
    if(ball.bounceEdge() == true){
      if (ball.getX() <= 0){
        // player2 get score
        this.player2 += 1;
      }
    }
  }
  
}
