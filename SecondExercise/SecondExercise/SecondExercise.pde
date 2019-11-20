import processing.serial.*;

// The serial port:
  Serial myPort;


void setup(){
  fullScreen();
// List all the available serial ports: 
  printArray(Serial.list());
  //printArray(myPort.list());
// Open the port you are using at the rate you want:
myPort = new Serial(this, Serial.list()[32], 9600);
// Send a capital A out the serial port: 
myPort.write(65);
}

void draw(){

}
