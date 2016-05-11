class Man extends Gameobject      //Man class
{ 
  PVector idlePos;                //position he rests at
  PVector target;                 //current target (either idle or bomb position)
  PVector movement;               //direction of movement
  
  Man(float x, float y)           //constructor
  {
    super(x, y);                  //super constuctor
    
    theta = 0;                    //set theta to 0 (initialize)
    
    speed = 2f;                   //set speed
    
    c = color(200, 50, 200);      //set color as Purple
    
    idlePos = new PVector(x, y);  //initialze vector
    target = new PVector();       //^^^
    movement = new PVector();     //^^^
    
    w = 20;                       //initialze sizes
    h = 30;                       //^^^
    halfW = w * 0.5f;             //^^^
    halfH = h * 0.5f;             //^^^
  }

  void update()                                          //update the man
  {
    target = (bomb.landed) ? bomb.pos : idlePos;         //if bomb has landed, set as target, if not set idle pos as target
        
    if(PVector.dist(target, pos) > 2.5)                  //distance to target check
    {
      movement = (PVector.sub(target, pos));             //subtract target pos from man pst to get direction
      movement.normalize();                              //normalize direction
      movement.mult(speed);                              //multiply direction by speed
      pos.add(movement);                                 //add direction to position
    }
    
    move();
    
    if(PVector.dist(bomb.pos, pos) < 2.5)                //distance to bomb check, are we close enough to collect
    {
      bomb.bombCollect();                                //collect bomb method
    }
  }
  
  void move()
  {
    pushMatrix();  
   
    translate(pos.x, pos.y);    //translate mand to desired position
    drawMan();                  //drawing
    
    popMatrix();   
      
  }
  
  void drawMan()      //draw the man
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