class Plane extends Gameobject    //plane class
{
  Plane(float x, float y)    //constructor
  {
    super(x, y);             //super constructor
    
    theta = HALF_PI;         //set to face left
            
    speed = 3;               //set speed
    
    w = 60;                  //setting sizes
    h = 20;
    
    c = (150);               //set color to grey

    reset(x, y);             //call reset method
  }
  
  void reset(float x, float y)    //reset position when goes offscreen
  {
    pos.x = x;
    pos.y = y;
  }
  
  void update()      //update plane
  {
    forward.x = sin(theta);      //set forward vector     
    forward.y = -cos(theta);
    
    forward.mult(speed);          //multiply forward vector by speed
    pos.add(forward);             //add forward vector to position vector
    
    if(pos.x > width + w)         //if plane goes offscreen
    {
      reset(-20, 50);             //call reset method
    }
    
    move();
  }
  
  void move()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);  //translate plane forward (based off rotation)
    rotate(theta);            //keep rotated
    
    drawPlane();              
    
    popMatrix();
  }
  
  void drawPlane()            //drawing the plane
  {
    fill(c);
    rectMode(CENTER);
    //stroke(0);
    rect(0, -10, w, h);
    rect(-10, +40, 25, h);
    rect(0, 0, h, w * 1.5f);
    fill(0);
    for(int i = 30; i > -40; i-=10)    //loop to draw the planes windows
    {
      rect(0, i, 5, 5);
    }
  }
}