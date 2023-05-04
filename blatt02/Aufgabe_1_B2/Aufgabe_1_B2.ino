void setup() {
pinMode(D1, OUTPUT);
digitalWrite(D1, LOW);
pinMode(D2, OUTPUT);
digitalWrite(D2, LOW);
pinMode(D5, OUTPUT);
digitalWrite(D5, LOW);
pinMode(D6, OUTPUT);
digitalWrite(D6, LOW);

}
void loop() {
  // Turn the device
  turn(0, 1000, 100);
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

