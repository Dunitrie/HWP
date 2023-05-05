
// These are just in case you don't have the right board and need to define the variables in order not to get an error
//const int D1 = 1;
//const int D2 = 2;
//const int D5 = 5;
//const int D6 = 6; 
//const int D9 = 9;
//const int D8 = 9;

const int SPEED_OF_SOUND = 340; // m/s

void setup() {
  Serial.begin(9600);
  
  pinMode(D1, OUTPUT);
  digitalWrite(D1, LOW);
  pinMode(D2, OUTPUT);
  digitalWrite(D2, LOW);
  pinMode(D5, OUTPUT);
  digitalWrite(D5, LOW);
  pinMode(D6, OUTPUT);
  digitalWrite(D6, LOW);
  pinMode(D8, OUTPUT);
  digitalWrite(D8, LOW);
}
void loop() {
  // Turn the device
  //turn(0, 1000, 100);
  Serial.println(measureDistance(D8));
  // drive(0, 1000, 100);
  // setMotor(0, true, 50);
  delay(5000);
}

void setMotor(bool motor, bool forward, uint16_t speed)  {
  if (motor) {
    if (forward) {
      digitalWrite(D1, 0);
      analogWrite(D2, speed);
    }
    else {
      digitalWrite(D2, 0);
      analogWrite(D1, speed);
    }
  }
  else{
    if (forward) {
    digitalWrite(D5, 0);
    analogWrite(D6, speed);
    }
    else {
      digitalWrite(D6, 0);
      analogWrite(D5, speed);
    }
  }
}

void drive(bool direction, uint16_t time, uint16_t speed) {
  // If direction==0: Drive backwards, otherwise forward with speed speed
  unsigned long starting_time = millis();

  while (millis() - starting_time < time) {
    setMotor(0, direction, speed);
    setMotor(1, direction, speed);
  }
  setMotor(0, direction, 0);
  setMotor(1, direction, 0);
}

void turn(bool direction, uint16_t time, uint16_t speed){
  unsigned long starting_time = millis();

  while (millis() - starting_time < time){
    if (direction) {
      setMotor(0, direction, speed);
      setMotor(1, !direction, speed);
    }
    else{
      setMotor(1, direction, speed);
      setMotor(0, !direction, speed);
    }
  }
  setMotor(0, direction, 0);
  setMotor(1, direction, 0);
}

double measureDistance(int ultrasonicPin){
  // Send a pulse
  pinMode(ultrasonicPin, OUTPUT);
  digitalWrite(ultrasonicPin, HIGH);
  delay(1);

  // Receive a pulse
  digitalWrite(ultrasonicPin, LOW);
  pinMode(ultrasonicPin, INPUT);
  //pulseIn(Pin, KindOfSignal, WaitTime)
  unsigned long pulseLength = pulseIn(ultrasonicPin, HIGH, 30000);

  // Return the distance
  if (pulseLength){
    // We measure the distance as length of the pulse times speed of sound, which is 340 m/s
    double distance = ((double)pulseLength/1000000) * (double) SPEED_OF_SOUND; // In m/s -> Divide by 100, if wanted 
    return distance;
  }
  else{
    return -1;
  }
}
