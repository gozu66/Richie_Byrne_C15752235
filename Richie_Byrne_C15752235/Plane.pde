class Plane extends Gameobject
{
  Plane(float x, float y)
  {
    super(x, y);  
    
    theta = HALF_PI;
            
    speed = 3;
    
    reset(x, y);

    w = 60;
    h = 20;
    
    c = (150);          //grey
  }
  
  void reset(float x, float y)
  {
    pos.x = x;
    pos.y = y;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
    forward.mult(speed);
    pos.add(forward);
    
    if(pos.x > width + w)
    {
      reset(-20, 50);
    }
    
    move();
  }
  
  void move()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(theta);
    
    drawPlane();
    
    popMatrix();
  }
  
  void drawPlane()
  {
    fill(c);
    rectMode(CENTER);
    //stroke(0);
    rect(0, -10, w, h);
    rect(-10, +40, 25, h);
    rect(0, 0, h, w * 1.5f);
    fill(0);
    for(int i = 30; i > -40; i-=10)
    {
      rect(0, i, 5, 5);
    }
  }
}