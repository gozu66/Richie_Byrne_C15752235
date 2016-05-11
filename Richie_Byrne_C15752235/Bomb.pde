class Bomb extends Gameobject
{
  PVector acc;
  PVector vel;

  float landingPoint; 

  float deltaTime;

  boolean released, landed;

  Bomb(float x, float y)
  {
    super(x, y);    
    
    released = false;
    
    acc = new PVector(0, 9.8f);
    
    vel = new PVector(50, 100);
    
    deltaTime = 1.0f / frameRate;
    
    c = color(150, 0, 0);            //Red
  }

  void bombDrop()
  {
    landingPoint = random(height * 0.5f, height);    
    vel = new PVector(50, 100);
    released = true; 
  }
  
  void bombCollect()
  {
    released = false;
    pos = new PVector(0, 0);
    landed = false;
  }

  void update()
  { 
    if(released)
    {
      drawBomb();
            
      if(pos.y < landingPoint)
      {
        landed = false;
        vel.add(acc);
        pos.add(PVector.mult(vel, deltaTime));  
      }
      else
      {
        landed = true;
      }
    }
    else
    {
      if(keyPressed && key == ' ' && !keyDown)
      {
        pos.x = plane.pos.x;
        pos.y = plane.pos.y;
        bomb.bombDrop();
        keyDown = true;
      }
    }
  }
  
  void drawBomb()
  {
    fill(c);
    rect(pos.x, pos.y, 10, 10);
  }

}