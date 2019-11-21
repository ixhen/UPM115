int POT_PIN = A7;
int VAL_POT;
int BUT_PIN = 2;
//int counter = 0;
boolean VAL;

void setup() {
  // put your setup code here, to run once:
  pinMode(POT_PIN, OUTPUT);
  pinMode(BUT_PIN, INPUT);
  
  // Initialize Serial
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  VAL_POT = analogRead(POT_PIN);
  VAL_POT= map(VAL_POT, 0, 1023, 0, 25);
  VAL =digitalRead(BUT_PIN);
  
  if (VAL==HIGH){
//    counter +=1;
    Serial.println(VAL);
//    delay(2000);
    }
  delay(100);
  
//  Serial.write(VAL_POT);
//    delay(1000);
  //map(VAL_POT, 0, 1023, 0, 25);
  //analogWrite(POT_PIN, VAL_POT);

//if (Serial.available() > 0 ){
  // print the temperature in the serial port
  //Serial.println(celsius);
  
//  Serial.println(map(VAL_POT, 0, 1023, 0, 25));
//  Serial.write(map(VAL_POT, 0, 1023, 0, 25));
  
  //}
  
  

  // 

/*
if (Serial.available() > 0 ){
  // print the temperature in the serial port
  Serial.println(celsius);
  }

*/
}
