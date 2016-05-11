class Man extends Gameobject
{ 
  PVector idlePos;
  PVector target;
  PVector movement;
  
  Man(float x, float y)
  {
    super(x, y);
    
    theta = 0;
    
    speed = 2f;
    
    c = color(200, 50, 200);    //Purple
    
    idlePos = new PVector(x, y);
    target = new PVector();
    movement = new PVector();
    
    w = 20;
    h = 30;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
  }

  void update()
  {
    target = (bomb.landed) ? bomb.pos : idlePos;
        
    if(PVector.dist(target, pos) > 2.5)
    {
      movement = (PVector.sub(target, pos));
      movement.normalize();
      movement.mult(speed);
      pos.add(movement);
    }
    
    move();
    
    if(PVector.dist(bomb.pos, pos) < 2.5)
    {
      bomb.bombCollect();
    }
  }
  
  void move()
  {
    pushMatrix();  
   
    translate(pos.x, pos.y);
    drawMan();
    
    popMatrix();   
      
  }
  
  void drawMan()
  {
    rectMode(CENTER);
    fill(c);
    rect(0, 0, w, h);
    rect(-halfW, h, halfW / 2, h);
    rect(halfW, h, halfW / 2, h);
    rect(-halfW - 5, -halfH + 10, halfW / 2, halfH);
    rect(halfW + 5, -halfH + 10, halfW / 2, halfH);
    ellipse(0, -h, h, w);
    rectMode(CORNER);
  }
}