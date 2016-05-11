

void setup()
{
  size(500, 500);
}

void draw()
{
  drawBackground();  
}

void drawBackground()
{
  noStroke();
  background(100, 100, 255);
  fill(100, 255, 150);
  rect(0, height * 0.5f, width, height * 0.5f);
}