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
//      String secondString = MsgReceived.substring(0,2);
//      Serial.print(MsgReceived);
//      parts = MsgReceived.split("-", 2);
//      String part1 = parts[0]; // 004
//      String part2 = parts[1]; // 034556-42
//      Serial.print(part2);

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
//    u8g.drawStr(20,20,results[0]);
//    u8g.drawStr(20,40,results[1]);
//    u8g.drawStr(20,60,results[1]);
//    u8g.drawStr(20,60,"encryptedInput");
 } while(u8g.nextPage()); 
  
    }
  

}
