import processing.serial.*;

// The serial port:
  Serial myPort;


void setup(){
  fullScreen();
// List all the available serial ports: 
  printArray(Serial.list());
  //printArray(myPort.list());
// Open the port you are using at the rate you want:
// Send a capital A out the serial port: myPort.write(65);
}

void draw(){

}
