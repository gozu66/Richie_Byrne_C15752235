class Cloud extends Gameobject
{
 
  Cloud(float x, float y)
  {
    super(x, y);  
    
    theta = PI + HALF_PI;
        
    forward = new PVector();
    
    reset(x, y);
  }
  
  void reset(float x, float y)
  {
    speed = random(1, 6);
    pos = new PVector(x, y);
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
    forward.mult(speed);
    pos.add(forward);
    
    if(pos.x < 0)
    {
      float rndX = width + random(width);
      float rndY = random(height * 0.5f);

      reset(rndX, rndY);
    }
    
    move();
  }
  
  void move()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(theta);
    
    drawCloud();
    
    popMatrix();
  }
  
  void drawCloud()
  {
    fill(255);
    ellipse(0, 0, 20, 20);
  }
}