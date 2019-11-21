#include "U8glib.h"
U8GLIB_SSD1306_128X64 u8g(13,11,2,3,4);
int BUT_PIN = 5;
boolean VAL;
String input,encryptedInput;
int encryptionOffset;
String MsgReceived;
String serialResponse = "";
#define ARRAYSIZE 3
//String[] parts;

void setup() {
  // put your setup code here, to run once:
  u8g.setFont(u8g_font_6x10);
  u8g.setColorIndex(1); 
  pinMode(BUT_PIN, INPUT);
  
  // Initialize Serial
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  
    VAL = digitalRead(BUT_PIN);
  
  if (VAL==HIGH){

    Serial.println(VAL);
    
    }
  delay(100);

  if (Serial.available() > 0){
      u8g.firstPage();
//      MsgReceived = Serial.readString();
      MsgReceived = Serial.readStringUntil("\n");

//  String one, two, three;
//    char buf[sizeof(MsgReceived)];
//    serialResponse.toCharArray(buf, sizeof(buf));
//    char *p = buf;
//    char *str;
//    int i =0;
//    String results[ARRAYSIZE];
//    while ((str = strtok_r(p, "-", &p)) != NULL) // delimiter is the minus sign
////      Serial.println(str);
//      results[i] = str;
//      i++;
////      u8g.drawStr(20,30,str);
      
  do {
//    String secondMessage
//      Serial.println(MsgReceived);
//    u8g.print(MsgReceived);
//    u8g.print("MsgReceived");
//    u8g.drawStr(20,20,MsgReceived);
    u8g.setPrintPos(4, 22);
    u8g.print(MsgReceived);
//    u8g.println("\nuserInput-offset-encryptedUserInput");
//    u8g.drawStr(20,20,"userInput");
    u8g.drawStr(0,40,"Inp-Offset-EncInp");
//    u8g.drawStr(20,60,results[1]);
//    u8g.drawStr(20,60,"encryptedInput");
 } while(u8g.nextPage()); 
  
    }
  

}
