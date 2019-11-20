import processing.serial.*;

Serial myPort;  // Create object from Serial class
Boolean bool = true ; 
void setup(){

  // List all the available serial ports:
  printArray(Serial.list());

  // Open the port where the Arduino is
  myPort = new Serial(this, Serial.list()[32], 9600);
}

void draw(){

  if(bool){
    myPort.write("A\n\0");
    bool = false;
  }
  
}
