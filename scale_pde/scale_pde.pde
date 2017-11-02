/**
 * Scale Shape.  
 * Illustration by George Brower. 
 * 
 * Move the mouse left and right to zoom the SVG file.
 * This shows how, unlike an imported image, the lines
 * remain smooth at any size.
 */
import processing.serial.*;

Serial serial;
int sensorValue;
PShape bot;

void setup() {
  size(640, 360);
    serial=new Serial(this,"COM5",9600);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("bot1.svg");
} 

void draw() {
  if(serial.available()>0)
  {
    sensorValue=serial.read();
  }
  background(102);
  translate(width/2, height/2);
  float zoom = map(sensorValue, 0, width, 0.1, 3);
  scale(zoom);
  shape(bot, -140, -140);
}