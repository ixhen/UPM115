import processing.serial.*;

String userInput = "";
String encryptedUserInput = "";
//int shiftValue;

boolean leaveDraw = false;

// Serial port
Serial myPort;

int state = 0; 
//String result=""; 
 
void setup() { 
  size(800, 800);
  userPrompt();
  //establishCommunicationToArduino();
  //encryptUserInput(userInput,5);
  
  /*
  if(leaveDraw) {
   
   encryptUserInput(userInput,5);
    //delay()
  }
  */
}
 
void draw() {
 //userPrompt();
 //encryptUserInput(userInput,getShiftValueFromArduino());
 /**/
 
 if(leaveDraw){
   encryptUserInput(userInput,5);
   leaveDraw = false;
   userPrompt();
    //delay()
  }
  //delay(1000);

}
 
void keyPressed() {
  if (key==ENTER||key==RETURN) {
    leaveDraw = true;
    state++;
  } else if(key == DELETE || key == BACKSPACE) {// TODO: If we press backspace, then delete the last character of the array
    //userInput += "2";
    userInput = userInput.substring( 0, userInput.length()-1 );
  }
  else
  userInput += key;
}

void userPrompt(){
  
  leaveDraw = true;
  background(255);
  switch (state) {
    // TODO: Change Background
  case 0: // User is still inputing 
    fill(0); 
    text ("Please enter something and hit enter to go on \n" + userInput, 133, 333); 
    break;
 
  case 1: // User is done with inputing, i.e. has pressed enter
    fill(255, 2, 2); 
    //text ("Thanks \n" + userInput, 133, 633); 
    text ("Thanks \n" + encryptedUserInput, 133, 633);
    break;
  }
}

String encryptUserInput(String input, int shiftValue){
  // Reference: https://codedost.com/css/java-program-caesar-cipheradditive-cipher/
  
  // Cast the string to char array
  char ch1[]=input.toCharArray();
  
  for (char ch: ch1) {
    
    int asciiValueOfEncryptedCharacter = ((int)ch + shiftValue) % 127;
    
    encryptedUserInput += (char)asciiValueOfEncryptedCharacter;
  }
  // 
  
  //System.out.println(encryptedUserInput);
  return encryptedUserInput;
}

void establishCommunicationToArduino(){
  // List all the available serial ports:
  printArray(Serial.list());

  // Open the port where the Arduino is
  myPort = new Serial(this, Serial.list()[32], 9600);
  // To write on the port just add : myPort.write("A\n\0"); !!!
}

int getShiftValueFromArduino(){
  if (myPort.available() > 0) {
    //String inBuffer = myPort.readString();
    //shiftValue = myPort.read();
  }
  return myPort.read();
}
