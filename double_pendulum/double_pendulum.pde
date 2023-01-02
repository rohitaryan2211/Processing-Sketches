// Length of the rods
float r1 = 200;
float r2 = 200;
// Mass of the balls
float m1 = 40;
float m2 = 40;
// Angles made by the objects with y-axis 
float a = PI/2;
float b = 0;
// Angular velocities of both objects
float a_v = 0;
float b_v = 0;
// Gravitation force
float g = 1;
// Initialising previous point for tracing
float px;
float py;
// Initialising translate to move the simulation to the center
float translatex;
float translatey;
// Canvas in the background for tracing
PGraphics canvas;

void setup(){
   size(1000,1000);
   translatex = width/2;
   translatey = 250;
   canvas = createGraphics(1000,1000);
   canvas.beginDraw();
   canvas.background(255);
   canvas.endDraw();
}

void draw(){
  
  float num1 = -g*(2*m1+m2)*sin(a);
  float num2 = -m2*g*sin(a-2*b);
  float num3 = -2*sin(a-b)*m2;
  float num4 = (a_v*a_v*r1*cos(a-b)+b_v*b_v*r2);
  float den = r1*(2*m1+m2-m2*cos(2*a-2*b));
  
  // Angular acceleration of ball 1
  float a_a = (num1+num2+num3*num4)/den;
  
  num1 = 2*sin(a-b);
  num2 = a_v*a_v*r1*(m1+m2);
  num3 = g*(m1+m2)*cos(a);
  num4 = b_v*b_v*r2*m2*cos(a-b);
  den = r2*(2*m1+m2-m2*cos(2*a-2*b));
  
  // Angular acceleration of ball 2
  float b_a = (num1*(num2+num3+num4))/den;
  
  // Create canvas as background
  image(canvas,0,0);
  // Translate the bodies and the rods to center of the screen
  translate(translatex, translatey);
  
  // Positions of balls in XY plane
  float x1 = r1 * sin(a);
  float y1 = r1 * cos(a);
  float x2 = x1 + r2 * sin(b);
  float y2 = y1 + r2 * cos(b);
  
  // Creating the rods
  stroke(0);
  strokeWeight(5);
  line(0,0,x1,y1);
  line(x1,y1,x2,y2);
  
  // Creating balls at the positions
  fill(0);
  ellipse(x1,y1,m1,m1);
  ellipse(x2,y2,m2,m2);
  
  // Updating angles and their angular velocities
  a_v += a_a;
  b_v += b_a;
  a += a_v;
  b += b_v;
  
  //// Damping the angular velocities with some air friction
  //a_v *= 0.999;
  //b_v *= 0.999;
  
  // Drawing the canvas to create line from previous point to current point
  canvas.beginDraw();
  canvas.translate(translatex, translatey);
  canvas.strokeWeight(2);
  canvas.stroke(0);
  if(frameCount > 1){
    canvas.line(px,py,x2,y2); 
  }
  canvas.endDraw();
  
  // Initialising current points as previous points for next iteration
  px = x2;
  py = y2;
  
  
}
