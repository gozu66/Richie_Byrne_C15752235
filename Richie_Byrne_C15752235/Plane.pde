class Plane extends Gameobject
{
  Plane(float x, float y)
  {
    super(x, y);  
    
    theta = HALF_PI;
        
    forward = new PVector();
    
    pos = new PVector(x, y);
    
    speed = 3;
    
    reset(x, y);

    w = 60;
    h = 20;
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
    fill(0);
    rect(0, 0, h, w);
  }
}