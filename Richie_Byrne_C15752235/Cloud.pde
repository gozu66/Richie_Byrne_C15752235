class Cloud extends Gameobject    //cloud class
{
 
  Cloud(float x, float y)        //cloud condtructor
  {
    super(x, y);                 //super constructor
    
    theta = PI + HALF_PI;        //set direction or clouds to face left
        
    c = 255;                     //set color to white
            
    reset(x, y);                 //call reset method
  }
  
  void reset(float x, float y)
  {
    w = random(40, 70);          //randomize cloud size
    h = random(40, 70);          //^^^
    
    halfW = w * 0.5f;            //set half sizes
    halfH = h * 0.5f;            //^^^
    
    speed = random(1, 6);        //randomoze cloud speed
    pos = new PVector(x, y);     //set cloud to offscreen (Right) position
  }
  
  void update()
  {
    forward.x = sin(theta);      //set forward vector 
    forward.y = -cos(theta);
    
    forward.mult(speed);         //multiply forward vector by speed
    pos.add(forward);            //add forward vector to position
    
    if(pos.x < -w)                             //if cloud offscreen left
    {
      float rndX = width + random(width);      //select random offscreen right position
      float rndY = random(height * 0.5f);

      reset(rndX, rndY);                       //call reset methods
    }
    
    move();
  }
  
  void move()
  {
    pushMatrix();  
    
    translate(pos.x, pos.y);    //translate movement
    rotate(theta);              //keep rotated
    
    drawCloud();                //draw cloud
    
    popMatrix();
  }
  
  void drawCloud()
  {
    fill(c);                          //color and draw the cloud
    ellipse(0, 0, w, h);
    ellipse(0, 20, halfW, halfH);
    ellipse(0, -20, halfW, halfH);
  }
}