
float len = 400;

float multiplier = map(mouseY, 0, height, 0, 1);


void setup(){
  size(1500,1000);
  
}

void draw(){
  background(51);
  float theta = map(mouseX, 0, width, 0, PI);
  float multiplier = map(mouseY, 0, height, 0.5, 0.8);
  translate(width/2, height);
  stroke(255);
  branch(len, theta, multiplier);
  
  
}

void branch(float h, float theta, float multiplier){
  
  h *= multiplier;
  if(h>10){
    pushMatrix();
    line(0,0,0,-h);
    translate(0,-h);
    rotate(theta);
    branch(h, theta, multiplier);
    popMatrix();
    pushMatrix();
    line(0,0,0,-h);
    translate(0,-h);
    rotate(-theta);
    branch(h, theta, multiplier);
    popMatrix();
  }
}
