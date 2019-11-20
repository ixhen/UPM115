int POT_PIN = A7;
int VAL_POT;

void setup() {
  // put your setup code here, to run once:

  
  pinMode(POT_PIN, OUTPUT);
  
  // Initialize Serial
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  VAL_POT = analogRead(POT_PIN);
  println(VAL_POT);
  map(VAL_POT, 0, 1023, 0, 25);
  //analogWrite(POT_PIN, VAL_POT);
  println(VAL_POT);
  delay(20);

/*
if (Serial.available() > 0 ){
  // print the temperature in the serial port
  Serial.println(celsius);
  }

*/
}
