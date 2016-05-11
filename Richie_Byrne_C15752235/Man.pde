class Man extends Gameobject
{ 
  PVector idlePos;
  PVector target;
  
  Man(float x, float y)
  {
    super(x, y);
    
    theta = 0;
    
    speed = 1.0f;
    
    c = color(200, 50, 200);    //Purple
    
    idlePos = new PVector(x, y);
    target = new PVector();
  }

  void update()
  {
    move();
    drawMan();
    
    target = (bomb.landed) ? bomb.pos : idlePos;
    
    if(PVector.dist(bomb.pos, pos) < 1)
    {
      bomb.bombCollect();
    }
  }
  
  void move()
  {
    if(pos.x < target.x)
      {
        pos.x++;
      }
      if(pos.x > target.x)
      {
        pos.x--;
      }
      if(pos.y > target.y)
      {
        pos.y--;
      }
      else if(pos.y < target.y)
      {
        pos.y++;
      }
    //if(bomb.landed)
    //{
    //  if(pos.x < bomb.pos.x)
    //  {
    //    pos.x++;
    //  }
    //  if(pos.x > bomb.pos.x)
    //  {
    //    pos.x--;
    //  }
    //  if(pos.y > bomb.pos.y)
    //  {
    //    pos.y--;
    //  }
    //  else if(pos.y < bomb.pos.y)
    //  {
    //    pos.y++;
    //  }
    //}  
    //else
    //{
    //  if(pos.x < idlePos.x)
    //  {
    //    pos.x++;
    //  }
    //  if(pos.x > idlePos.x)
    //  {
    //    pos.x--;
    //  }
    //  if(pos.y > idlePos.y)
    //  {
    //    pos.y--;
    //  }
    //  else if(pos.y < idlePos.y)
    //  {
    //    pos.y++;
    //  }
    //}
  }
  
  void drawMan()
  {
    rectMode(CENTER);
    fill(c);
    rect(pos.x, pos.y, 20, 50);
    rectMode(CORNER);
  }
}