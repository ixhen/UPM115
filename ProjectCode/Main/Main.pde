import processing.serial.*; 

String userInput = "";
String encryptedUserInput = ""; // Define and initialize the encryptedUserInput variable
int offset; // Define the offset variable
PImage bg; // Define the background variable

Serial myPort; // Define the Serial variable

int state = 0; // Define and initialize the state variable. Its going to change to 1 if the user presses enter
 
void setup() { 
  size(800, 450); // Set the screen size
  establishCommunicationToArduino(); // Call the establishCommunicationToArduino() function
  offset = 0; // Set the offset to 0
  
  bg=loadImage("etsit.png"); // Set the background image
 
}
 
void draw() {
  encryptedUserInput = "";
  
   background(bg); // Set the background
   userPrompt(); // Call the userPrompt() function
   
   updateCounterValue();
   if (state==1){
   
   encryptUserInput(userInput,int(offset));
   
   sendEncryptedMessageBackToArduino();
   state=0;
   }
   
   
   text ("The encrypting offset is: "+ offset, 30,340);
   
   fill(255);
   textSize(18);
   text ("Your encrypted text: " + encryptedUserInput, 30, 380);
   
   
  
}

//Function called every time a key is pressed
void keyPressed() {
  if (key==ENTER||key==RETURN) { // if the user presses ENTER 
    state=1; // change the state to one
  } else if(key == DELETE || key == BACKSPACE) {// If user presses backspace, then delete the last character of the array
    if (userInput.length() != 0){
    userInput = userInput.substring( 0, userInput.length()-1 );
    }
}
  else{ // every other character is going to be added to the string
    userInput += key;
  }
  
}

// Prompt the user to add text
void userPrompt(){
  fill(255);
  textSize(18);
  text ("Enter original text: " + userInput, 30, 300); 
  
}

// Function that encrypts the user input by a shift/offset value
void encryptUserInput(String input, int shiftValue){
  encryptedUserInput="";
  // Reference: https://codedost.com/css/java-program-caesar-cipheradditive-cipher/
  
  // Cast the string to char array
  char ch1[]=input.toCharArray(); // convert the input to a character array
  
  for (char ch: ch1) { // For each character
    
    int asciiValueOfEncryptedCharacter = ((int)ch + shiftValue) % 127; // The new value is defined as (oldValue + shiftValue) modulo 127. 127 so it circles around the UNICODE values
    encryptedUserInput += (char)asciiValueOfEncryptedCharacter; // Attach the character to the encryptedUserInput string
  }
  
  
}


void establishCommunicationToArduino(){
  
  myPort = new Serial(this, Serial.list()[32], 9600); // Establish communication on the port of element 32 on the array of possible ports in the serial connection
 
}

// Update the offset value 
void updateCounterValue(){
  
  while (myPort.available() > 0) { // If input is present in the connection
    
    String actual = myPort.readString(); // Read the input and save it on a string
    println(actual);
    
      offset++; // Increase the offset
      
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

// Write on the serial connection to Arduino
void sendEncryptedMessageBackToArduino(){
  myPort.write(userInput + "-" + offset + "-" + encryptedUserInput + "\n" );
}
