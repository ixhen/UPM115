
String userInput = "";
String encryptedUserInput;

int state = 0; 
//String result=""; 
 
void setup() { 
  size(800, 800);
}
 
void draw() { 
 
  userPrompt();
 
}
 
void keyPressed() {
  
  if (key==ENTER||key==RETURN) {
    state++;
  } else if(key == DELETE || key == BACKSPACE) {// TODO: If we press backspace, then delete the last character of the array
    //userInput += "2";
    userInput = userInput.substring( 0, userInput.length()-1 );
  }
  else
  userInput += key;
}

void userPrompt(){
  
  background(255);
  switch (state) {
    // TODO: Change Background
  case 0: // User is still inputing 
    fill(0); 
    text ("Please enter something and hit enter to go on \n"+userInput, 133, 333); 
    break;
 
  case 1: // User is done with inputing, i.e. has pressed enter
    fill(255, 2, 2); 
    text ("Thanks \n" + userInput, 133, 633); 
    break;
  }
}

String encryptUserInput(String input){
  // Reference: https://codedost.com/css/java-program-caesar-cipheradditive-cipher/
  
  
  
  return " ";
}
