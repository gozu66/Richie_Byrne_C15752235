PVector pos;
PVector acc;
PVector vel;

float landingPoint; 

float deltaTime;

boolean released;

class Bomb extends Gameobject
{
  Bomb(float x, float y)
  {
    super(x, y);    
    
    released = false;
    
    pos = new PVector(50, height-50);
    acc = new PVector(0, 9.8f);
    vel = new PVector(50, 200);
    deltaTime = 1.0f / frameRate;
  }

  void bombDropAndCollect()
  {
    landingPoint = random(height * 0.5f, height);
    released = !released;    
  }

  void update()
  { 
    if(released)
    {
      drawBomb();
            
      if(pos.y < landingPoint)
      {
        vel.add(acc);
        pos.add(PVector.mult(vel, deltaTime));  
      }
    }
  }
  
  void drawBomb()
  {
    fill(150, 0, 0);
    rect(pos.x, pos.y, 10, 10);
  }

}