import processing.serial.*;

String userInput = "";
String encryptedUserInput = "";
//int shiftValue;



// Serial port
Serial myPort;

int state = 0; 
//String result=""; 
 
void setup() { 
  size(800, 800);
  establishCommunicationToArduino();
}
 
void draw() {
  
   userPrompt();
   if (state==1){
   
   encryptUserInput(userInput,5);
   state=0;
   }
   text ("Your encrypted text:  \n" + encryptedUserInput, 133, 633);
   text ("The encrypting offset is" + (getShiftValueFromArduino()), 133,650); 
}
void keyPressed() {
  if (key==ENTER||key==RETURN) {
    
    state=1;
  } else if(key == DELETE || key == BACKSPACE) {// TODO: If we press backspace, then delete the last character of the array
    //userInput += "2";
    if (encryptedUserInput != ""){
    userInput = userInput.substring( 0, userInput.length()-1 );
  }
}
  else
  userInput += key;
}

void userPrompt(){
  background(255);
  // TODO: Change Background
  fill(0); 
  text ("Enter original text:  \n" + userInput, 133, 333); 
    
 
 
}

void encryptUserInput(String input, int shiftValue){
  encryptedUserInput="";
  // Reference: https://codedost.com/css/java-program-caesar-cipheradditive-cipher/
  
  // Cast the string to char array
  char ch1[]=input.toCharArray();
  
  for (char ch: ch1) {
    
    int asciiValueOfEncryptedCharacter = ((int)ch + shiftValue) % 127;
    
    encryptedUserInput += (char)asciiValueOfEncryptedCharacter;
  }
  
  
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
