class Cloud extends Gameobject
{
 
  Cloud(float x, float y)
  {
    super(x, y);  
    
    theta = PI + HALF_PI;
        
    c = 255;
            
    reset(x, y);
  }
  
  void reset(float x, float y)
  {
    w = random(40, 70);
    h = random(40, 70);
    
    halfW = w * 0.5f;
    halfH = h * 0.5f;
    
    speed = random(1, 6);
    pos = new PVector(x, y);
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
    forward.mult(speed);
    pos.add(forward);
    
    if(pos.x < -w)
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
    fill(c);
    ellipse(0, 0, w, h);
    ellipse(0, 20, halfW, halfH);
    ellipse(0, -20, halfW, halfH);
  }
}