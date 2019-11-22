#include "U8glib.h" 
U8GLIB_SSD1306_128X64 u8g(13,11,2,3,4);

int BUT_PIN = 5;  // Initialize button pin number 5
boolean VAL;
String input,encryptedInput;
int encryptionOffset;
String MsgReceived;
String serialResponse = "";

void setup() {
  // put your setup code here, to run once:
  u8g.setFont(u8g_font_6x10); // Sets the font of the characters on screen
  u8g.setColorIndex(1); // Sets the color index of the characters on screen
  pinMode(BUT_PIN, INPUT); // Sets the button pin as input
  
  // Initialize Serial
Serial.begin(9600); // Initialize the Serial connection to 9600 bouds

}

void loop() {
  // put your main code here, to run repeatedly:
  
    VAL = digitalRead(BUT_PIN); // Read the value of the button
  
  if (VAL==HIGH){ // If it is pressed

    Serial.println(VAL); // Send that value to Processing program through the serial connection
    
    }
  delay(100);

  if (Serial.available() > 0){ // If the Processing program has sent information on the serial connection
      u8g.firstPage();
      MsgReceived = Serial.readStringUntil("\n"); // Read the message until a new line character is read

      
  do {
    u8g.setPrintPos(4, 22); // Set the coordinates where the String is going to be displayed
    u8g.print(MsgReceived); // Display the message received
    u8g.drawStr(0,40,"Inp-Offset-EncInp"); // Add a new line that explains the values above it are Input-Offset-EncryptedValue
 } while(u8g.nextPage()); 
  
    }
  

}
