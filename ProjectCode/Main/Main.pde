import processing.serial.*;

String userInput = "", inBuffer="",inBufferClean="";
String encryptedUserInput = "";
//int shiftValue;
int offset;


// Serial port
Serial myPort;

int state = 0; 
//String result=""; 
 
void setup() { 
  size(800, 800);
  establishCommunicationToArduino();
  offset = 0;
}
 
void draw() {
   
   userPrompt();
   
   updateCounterValue(); // ABOUT the debouncing of counter: 
   if (state==1){
   
   encryptUserInput(userInput,int(offset));
   
   sendEncryptedMessageBackToArduino();
   state=0;
   }
   text ("Your encrypted text:  \n" + encryptedUserInput, 133, 633);
   
   text ("The encrypting offset is: "+ offset, 133,660);
  
}
void keyPressed() {
  if (key==ENTER||key==RETURN) {
    state=1;
  } else if(key == DELETE || key == BACKSPACE) {// TODO: If we press backspace, then delete the last character of the array
    //userInput += "2";
    if (userInput.length()!=0){
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
  
  myPort = new Serial(this, Serial.list()[32], 9600);
  // To write on the port just add : myPort.write("A\n\0"); !!!
}

void updateCounterValue(){
  
  while (myPort.available() > 0) {
    
    String actual = myPort.readString();
    
      println(actual);
      offset++;
      
      }
}

String setShiftValueFromArduino(){
  String counter;
  if (myPort.available() > 0) {
    
    counter = myPort.readString();
    //if (counter != null){
      println(counter);
      
      }
  else{ counter = "0";
    }
    return counter;
}

int setShiftValueFromArduinoInteger(){
  int counter;
  if (myPort.available() > 0) {
    
    counter = int(myPort.readString());
    
    println(counter);
    
    //return counter;
   }else {
     counter = 0;
  }
  return counter;
}

void sendEncryptedMessageBackToArduino(){
  myPort.write(userInput + "-" + offset + "-" + encryptedUserInput + "\n" );
}
